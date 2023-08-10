{
  lib,
  pkgs,
  config,
  ...
}:
with lib; {
  options.zola.enable = mkEnableOption "zola settings";

  config = mkIf config.zola.enable {
    home.packages = with pkgs; [zola];

    home.file = {
      np = {
        enable = true;
        executable = true;
        source = let
          gum = "${pkgs.gum}/bin/gum";
        in
          pkgs.writeShellScript "np" ''
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

            title=$(${gum} input --placeholder="title")
            echo "$info_tag $(${gum} style "Got the site name:" --italic) $(${gum} style "$title" --bold  --italic)"

            slug=$(${gum} input --placeholder="slug of the post" | sed 's/  / /g' | sed 's/ /_/g')
            echo "$info_tag $(${gum} style "Got the slug title:" --italic) $(${gum} style "$slug" --bold  --italic)"

            file_name="$date-$slug.md"
            echo "$info_tag $(${gum} style "The output file will be named:" --italic) $(${gum} style "$file_name" --bold  --italic)"

            repo_local="${config.repos.prma.path}/content"
            echo "$info_tag $(${gum} style "And located at:" --italic) $(${gum} style "$repo_local" --bold  --italic)"

            cd "$repo_local" || exit


            # Command to be executed
            echo \
            "+++
            title = \"$title\"
            description = \"\"
            date = $date
            draft = true
            slug = \"$slug\"
            insert_anchor_links = \"heading\"

            [taxonomies]
            categories = []
            tags  = []

            [extra]
            +++


            # Dear Readers...


            {{ discussion() }}
            " >> $file_name

            if [ $? == 0 ]; then
                echo "$succ_tag $(${gum} style "successfully created:" --italic) $(${gum} style "$repo_local/$file_name" --bold)"
            fi
          '';
        target = ".local/bin/np";
      };
    };
  };
}
