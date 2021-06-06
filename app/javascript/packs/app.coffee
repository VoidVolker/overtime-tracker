class Application
    @default =
        notification:
            timeout: 5000

    constructor: ->
        switch window.location.pathname
            when '/' then @page = new HomePage

    notification: (type, msg, timeout = Application.default.notification.timeout) ->
        switch type
            when 'success' then icon = 'check'
            when 'warning' then icon = 'exclamation'
            when 'danger'  then icon = 'exclamation-triangle'
            else # 'alert' type or something else can be
                type = 'primary'
                icon = 'bell'

        UIkit.notification({
            message: "<i class=\"fas fa-#{icon}\"></i>&nbsp;&nbsp;#{msg}",
            status: "#{type}-hivis",
            pos: 'top-center',
            timeout: timeout
        });
        @

class HomePage
    constructor: ->
        #
        approvalsCnt = $ '#pending-approvals'
        if approvalsCnt.length
            approvals = $ '.approval', approvalsCnt
            for approval in approvals
                approveBtn = $ '.approve-post', approval
                approveBtn[0].label = $ '.uk-label', approval
                approveBtn.click ->
                    btn = @
                    btn$ = $ @
                    path = btn$.data 'path'
                    # console.log path, btn.label
                    $.get( path, (post) ->
                        console.log 'post', post
                        btn.label.removeClass 'uk-label-warning'
                        btn.label.addClass 'uk-label-success'
                        btn.label.text post.status
                    ).fail ->
                        APP.notification 'danger', 'Post approving failed'



$ -> window.APP = new Application
