#!rsc by RouterOS

:local profile "Daily";
:local minUptome 0;

:local x
:set x 0

:log message="Deleting used accounts ...."

{
    :foreach i in=[/ip hotspot user find where uptime>minUptome and profile=$profile] do={
        :local deleted [/ip hotspot user remove $i];
        :set x x + 1;
        :log message="User account deleted $i $deleted"
    }
}

:if ($x=0) do={:log message="No user account deleted"}
:log message="( $x ) Script completed account deleted"