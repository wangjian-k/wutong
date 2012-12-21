package com.borqs.server.wutong.notif;

import com.borqs.server.base.context.Context;
import com.borqs.server.base.log.Logger;
import com.borqs.server.base.util.StringUtils2;
import com.borqs.server.wutong.Constants;
import com.borqs.server.wutong.GlobalLogics;
import com.borqs.server.wutong.group.GroupImpl;
import com.borqs.server.wutong.group.GroupLogic;
import org.apache.commons.lang.StringUtils;

import java.util.ArrayList;
import java.util.List;

public class PollInviteNotifSender extends NotificationSender {

    private static final Logger L = Logger.getLogger(PollInviteNotifSender.class);

    public PollInviteNotifSender() {
        super();
        isReplace = false;
    }

    @Override
    public List<Long> getScope(Context ctx, String senderId, Object... args) {
        List<Long> userIds = new ArrayList<Long>();
        String targetIds = (String) args[0];
        List<Long> targets = StringUtils2.splitIntList(targetIds, ",");

            for (long target : targets) {
                if (!userIds.contains(target)) {
                    if ((target >= Constants.PUBLIC_CIRCLE_ID_BEGIN)
                            && (target <= Constants.GROUP_ID_END)) {
                        GroupLogic groupImpl = GlobalLogics.getGroup();
                        String members = groupImpl.getAllMembers(ctx, target, -1, -1, "");
                        List<Long> memberIds = StringUtils2.splitIntList(members, ",");
                        userIds.addAll(memberIds);
                    } else
                        userIds.add(target);
                }
            }

        //exclude sender
        if(StringUtils.isNotBlank(senderId))
        {
            userIds.remove(Long.parseLong(senderId));
        }

        L.trace(ctx, "Poll Invite Notification Receive userIds: " + userIds);
        return userIds;
    }

    @Override
    protected String getSettingKey(Context ctx) {
        return Constants.NTF_POLL_INVITE;
    }

    @Override
    protected String getAppId(Context ctx, Object... args) {
        return (String) args[0];
    }

    @Override
    public String getTitle(Context ctx, Object... args) {
        String title = (String) args[0];
        String source = (String) args[1];

        return source + " invite you to vote 【" + title + "】";
    }

    @Override
    protected String getUri(Context ctx, Object... args) {
        return "borqs://poll/details?id=" + args[0];
    }

    @Override
    protected String getTitleHtml(Context ctx, Object... args) {
        String title = (String) args[0];
        String pollId = (String) args[1];
        String pollSchema = "<a href=\"borqs://poll/details?id=" + pollId + "\">" + title + "</a>";
        String sourceId = (String) args[2];
        String source = (String) args[3];
        String sourceSchema = "<a href=\"borqs://profile/details?uid=" + sourceId + "&tab=2\">" + source + "</a>";
        
        return sourceSchema + " invite you to vote 【" + pollSchema + "】";
    }

}
