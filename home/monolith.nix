{
  pkgs,
  lib,
  config,
  ...
}:
with lib; {
  options.monolith.enable = mkEnableOption "monolith settings";

  config = mkIf config.monolith.enable {
    home.packages = with pkgs; [
      monolith
    ];

    home.file = {
      archit = {
        enable = true;
        executable = true;
        source = let
          gg = "${pkgs.go-graft}/bin/gg";
          gum = "${pkgs.gum}/bin/gum";
          monolith = "${pkgs.monolith}/bin/monolith";
        in
          pkgs.writeShellScript "archit" ''
            # Function to handle Ctrl+C (SIGINT)

            info_tag=$(${gum} style  "[INFO]" --bold --background=6 --foreground=16)
            errr_tag=$(${gum} style  "[ERRR]" --bold --background=3 --foreground=16)
            succ_tag=$(${gum} style  "[SUCC]" --bold --background=2 --foreground=16)
            warn_tag=$(${gum} style  "[WARN]" --bold --background=3 --foreground=16)

            function ctrl_c() {
              echo ""
              echo "$info_tag $(${gum} style "got a request to exit, exiting..." --italic)"
              exit 1
            }

            # Trap SIGINT signal (Ctrl+C) and call ctrl_c function
            trap ctrl_c INT

            echo "$info_tag $(${gum} style "starting..." --italic)"



            date=$(date -I)
            echo "$info_tag $(${gum} style "Got the date:" --italic) $(${gum} style "$date" --bold  --italic)"

            site_name=$(${gum} input --placeholder="name of the site"| sed 's/  / /g' | sed 's/ /_/g')
            echo "$info_tag $(${gum} style "Got the site name:" --italic) $(${gum} style "$site_name" --bold  --italic)"

            page_title=$(${gum} input --placeholder="title of the page" | sed 's/  / /g' | sed 's/ /_/g')
            echo "$info_tag $(${gum} style "Got the page title:" --italic) $(${gum} style "$page_title" --bold  --italic)"

            file_name="$date-$site_name-$page_title.html"
            echo "$info_tag $(${gum} style "The output file will be named:" --italic) $(${gum} style "$file_name" --bold  --italic)"

            repo_local=${config.repos.webarchive.path}
            echo "$info_tag $(${gum} style "An located at:" --italic) $(${gum} style "$repo_local" --bold  --italic)"

            url=$0


            if [ -z "$1" ]; then
              url=$(${gum} input --placeholder="url")
            else
              url="$1"
            fi

            echo "$info_tag $(${gum} style "The url is:" --italic) $(${gum} style "$url" --bold  --italic)"

            cd "$repo_local" || exit


            # Command to be executed
            ${monolith} -F -e -I -o "$file_name" "$url"

            # Loop until the command succeeds (exit code 0)
            while [ $? -ne 0 ]; do

              echo "$warn_tag $(${gum} style "with an error, trying again..." --italic)"

              # Add a delay (optional, to prevent excessive looping)
              sleep 1

              # Execute the command again
              ${gg} ${monolith} -F -e -I -o "$file_name" "$url"
            done

            if [ $? == 0 ]; then
                echo "$succ_tag $(${gum} style "successfully downloaded:" --italic) $(${gum} style "$repo_local/$file_name" --bold) $(${gum} style "from:" --italic) $(${gum} style "$url" --bold)"
            fi
          '';
        target = ".local/bin/archit";
      };
    };
  };
}
