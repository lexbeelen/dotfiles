#!/bin/sh

function weather() {
   city="$1"

   if [ -z "$city" ]; then
      city="Eindhoven"
   fi

   eval "curl http://wttr.in/${city}"
}
