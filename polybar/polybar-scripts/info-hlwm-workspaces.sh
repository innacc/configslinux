#!/usr/bin/env bash

herbstclient --idle "tag_*" 2>/dev/null | {

    while true; do
        # Read tags into $tags as array
        IFS=$'\t' read -ra tags <<< "$(herbstclient tag_status)"
        {
            for i in "${tags[@]}" ; do
                # Read the prefix from each tag and render them according to that prefix
                case ${i:0:1} in
                    '#')
			# the tag is viewed on the focused monitor
			# TODO Add your formatting tags for focused workspaces
			echo "%{u#E89}%{+u}"
                        ;;
                    ':')
                        # : the tag is not empty
                        # TODO Add your formatting tags for occupied workspaces
			echo "%{u#634}%{+u}"
                        ;;
                    '!')
                        # ! the tag contains an urgent window
                        # TODO Add your formatting tags for workspaces with the urgent hint
			echo "%{u#ff0}%{+u}"
                        ;;
                    '-')
                        # - the tag is viewed on a monitor that is not focused
                        # TODO Add your formatting tags for visible but not focused workspaces
                        ;;
		    '.')
			echo "%{u#333}%{+u}"
			;;
                    *)
                        # . the tag is empty
                        # There are also other possible prefixes but they won't appear here
			echo "%{F-}%{B-}" # Add your formatting tags for empty workspaces
                        ;;
                esac

                echo "%{A1:herbstclient use ${i:1}:} ${i:1} %{A u- -o F- B-}"
            done

            echo "%{F-}%{B-}"
        } | tr -d "\n"

    echo

    # wait for next event from herbstclient --idle
    read -r || break
done
} 2>/dev/null
