class Application
    @default =
        notification:
            timeout: 5000

    constructor: ->
        switch window.location.pathname
            when '/' then @page = new HomePage

class HomePage
    constructor: ->
        confirmationsCnt = $ '#pending-confirmations'
        approvalsCnt = $ '#pending-approvals'

        # For employee
        if confirmationsCnt.length is 1
            confirmations = $ '.confirmation', confirmationsCnt
            for confirmation in confirmations
                confirmationBtn = $ '.confirm-audit-log', confirmation
                confirmationBtn.click ->
                    btn = @
                    btn$ = $ @
                    path = btn$.data 'path'
                    UIkit.modal.confirm('Are you sure you want to confirm that you did not perform any overtime?').then(
                        ->
                            $.get( path, (post) ->
                                btn$.prop 'disabled', true
                            ).fail ->
                                Notification 'danger', 'Post approving failed'
                    )
        # For admin
        else if approvalsCnt.length is 1
            approvals = $ '.approval', approvalsCnt
            for approval in approvals
                approveBtn = $ '.approve-post', approval
                approveBtn[0].label = $ '.uk-label', approval
                approveBtn.click ->
                    btn = @
                    btn$ = $ @
                    path = btn$.data 'path'
                    $.get( path, (post) ->
                        btn.label.removeClass 'uk-label-warning'
                        btn.label.addClass 'uk-label-success'
                        btn.label.text post.status
                    ).fail ->
                        Notification 'danger', 'Post approving failed'

window.Notification = Notification = (type, msg, timeout = Application.default.notification.timeout) ->
    switch type
        when 'success' then icon = 'check'
        when 'warning' then icon = 'exclamation'
        when 'danger'  then icon = 'exclamation-triangle'
        else # 'alert' type or something else can be
            type = 'primary'
            icon = 'bell'

    UIkit.notification(
        message: "<i class=\"fas fa-#{icon}\"></i>&nbsp;&nbsp;#{msg}"
        status: "#{type}-hivis"
        pos: 'top-center'
        timeout: timeout
    )



$ -> window.APP = new Application
