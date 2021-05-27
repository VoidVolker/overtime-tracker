class Application
    @default =
        notification:
            timeout: 5000

    constructor: ->

    notification: (type, msg, timeout = Application.default.notification.timeout) ->
        switch type
            when 'primary' then icon = 'bell'
            when 'success' then icon = 'check'
            when 'warning' then icon = 'exclamation'
            when 'danger'  then icon = 'exclamation-triangle'

        UIkit.notification({
            message: "<i class=\"fas fa-#{icon}\"></i>&nbsp;&nbsp;#{msg}",
            status: "#{type}-hivis",
            pos: 'top-center',
            timeout: timeout
        });
        @

window.APP = new Application

