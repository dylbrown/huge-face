import Toybox.Graphics;
import Toybox.Lang;
import Toybox.System;
import Toybox.Time;
import Toybox.WatchUi;

class hugeFaceView extends WatchUi.WatchFace {

    function initialize() {
        WatchFace.initialize();
    }

    // Load your resources here
    function onLayout(dc as Dc) as Void {
        setLayout(Rez.Layouts.WatchFace(dc));
    }

    // Called when this View is brought to the foreground. Restore
    // the state of this View and prepare it to be shown. This includes
    // loading resources into memory.
    function onShow() as Void {
    }

    // Update the view
    function onUpdate(dc as Dc) as Void {
        // Get and show the current time
        var clockTime = System.getClockTime();
        // var timeString = Lang.format("$1$\n$2$", [clockTime.hour, clockTime.min.format("%02d")]);
        var hour = View.findDrawableById("HourLabel") as Text;
        var minute = View.findDrawableById("MinuteLabel") as Text;
        var day_of_week = View.findDrawableById("DayWeekLabel") as Text;
        var day = View.findDrawableById("DayLabel") as Text;
        hour.setText((clockTime.hour % 12).format("%01X"));
        minute.setText(clockTime.min.format("%02d"));
        var today = Time.Gregorian.info(Time.now(), Time.FORMAT_LONG);
        day_of_week.setText(today.day_of_week.toUpper());
        day.setText(today.day < 10 ? today.day.format("%1u") : today.day.format("%2u"));

        // Call the parent onUpdate function to redraw the layout
        View.onUpdate(dc);
    }

    // Called when this View is removed from the screen. Save the
    // state of this View here. This includes freeing resources from
    // memory.
    function onHide() as Void {
    }

    // The user has just looked at their watch. Timers and animations may be started here.
    function onExitSleep() as Void {
    }

    // Terminate any active timers and prepare for slow updates.
    function onEnterSleep() as Void {
    }

}
