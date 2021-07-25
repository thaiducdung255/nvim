vim.g.dashboard_default_executive = 'telescope'
vim.g.dashboard_custom_section = {
   a = {
      description = {
         '  Find File          '
      },
      command = 'Telescope find_files'
   },
   b = {
      description = {
         '  Recently Used Files'
      },
      command = 'Telescope oldfiles'
   },
   c = {
      description = {
         '  Grep Text          '
   },
      command = 'Telescope live_grep'
   },
   d = {
      description = {
         '  Settings           '
   },
      command = ':e ~/.config/nvim/lua/configs.lua'
   }
   -- e = {description = {'  Marks              '}, command = 'Telescope marks'}
}

-- file_browser = {description = {' File Browser'}, command = 'Telescope find_files'},

-- vim.g.dashboard_custom_shortcut = {
--     a = 'f',
--     find_word = 'SPC f a',
--     last_session = 'SPC s l',
--     new_file = 'SPC c n',
--     book_marks = 'SPC f b'
-- }
-- find_history = 'SPC f h',

-- vim.g.dashboard_session_directory = '~/.cache/nvim/session'

local dashboardHeaders = {
   Monday = {
      '              _                  _         _                  ',
      '             (_)                (_)       | |      _          ',
      ' ____  _   _  _  ____     ____   _   ____ | |__  _| |_  _   _ ',
      '|  _ \\| | | || ||    \\   |  _ \\ | | / _  ||  _ \\(_   _)| | | |',
      '| | | |\\ V / | || | | |  | | | || |( (_| || | | | | |_ | |_| |',
      '|_| |_| \\_/  |_||_|_|_|  |_| |_||_| \\___ ||_| |_|  \\__) \\__  |',
      '                                   (_____|             (____/ ',
      '',
      '',
   },
   Tuesday = {
      '   _      _     _  _        _      _  _____ _     _____ ___  _',
      '  / \\  /|/ \\ |\\/ \\/ \\__/|  / \\  /|/ \\/  __// \\ /|/__ __\\  \\//',
      '  | |\\ ||| | //| || |\\/||  | |\\ ||| || |  _| |_||  / \\   \\  / ',
      '  | | \\||| \\// | || |  ||  | | \\||| || |_//| | ||  | |   / /  ',
      '  \\_/  \\|\\__/  \\_/\\_/  \\|  \\_/  \\|\\_/\\____\\\\_/ \\|  \\_/  /_/   ',
      '',
      '',
   },
   Wednesday = {
      '   ____   __ __  ____  ___ ___      ____   ____   ____  __ __  ______  __ __ ',
      '  |    \\ |  |  ||    ||   |   |    |    \\ |    | /    ||  |  ||      ||  |  |',
      '  |  _  ||  |  | |  | | _   _ |    |  _  | |  | |   __||  |  ||      ||  |  |',
      '  |  |  ||  |  | |  | |  \\_/  |    |  |  | |  | |  |  ||  _  ||_|  |_||  ~  |',
      '  |  |  ||  :  | |  | |   |   |    |  |  | |  | |  |_ ||  |  |  |  |  |___, |',
      '  |  |  | \\   /  |  | |   |   |    |  |  | |  | |     ||  |  |  |  |  |     |',
      '  |__|__|  \\_/  |____||___|___|    |__|__||____||___,_||__|__|  |__|  |____/ ',
      '',
      '',
   },
   Thursday = {
      '                                                )     )       ',
      '           )   (      )           (   (  (   ( /(  ( /( (     ',
      '    (     /((  )\\    (       (    )\\  )\\))(  )\\()) )\\()))\\ )  ',
      '    )\\ ) (_))\\((_)   )\\  \'   )\\ )((_)((_))\\ ((_)\\ (_))/(()/(  ',
      '   _(_/( _)((_)(_) _((_))   _(_/( (_) (()(_)| |(_)| |_  )(_)) ',
      '  | \' \\))\\ V / | || \'  \\() | \' \\))| |/ _` | | \' \\ |  _|| || | ',
      '  |_||_|  \\_/  |_||_|_|_|  |_||_| |_|\\__, | |_||_| \\__| \\_, | ',
      '                                     |___/              |__/  ',
      '',
      '',
   },
   Friday = {
      '                .__                   .__         .__      __           ',
      '    ____ ___  __|__|  _____     ____  |__|  ____  |  |__ _/  |_  ___.__.',
      '   /    \\\\  \\/ /|  | /     \\   /    \\ |  | / ___\\ |  |  \\\\   __\\<   |  |',
      '  |   |  \\\\   / |  ||  Y Y  \\ |   |  \\|  |/ /_/  >|   Y  \\|  |   \\___  |',
      '  |___|  / \\_/  |__||__|_|  / |___|  /|__|\\___  / |___|  /|__|   / ____|',
      '       \\/                 \\/       \\/    /_____/       \\/        \\/     ',
      '',
      '',
   },
   Saturday = {
      '   __    _  __   __  ___  __   __   __    _  ___  _______  __   __  _______  __   __ ',
      '  |  |  | ||  | |  ||   ||  |_|  | |  |  | ||   ||       ||  | |  ||       ||  | |  |',
      '  |   |_| ||  |_|  ||   ||       | |   |_| ||   ||    ___||  |_|  ||_     _||  |_|  |',
      '  |       ||       ||   ||       | |       ||   ||   | __ |       |  |   |  |       |',
      '  |  _    ||       ||   ||       | |  _    ||   ||   ||  ||       |  |   |  |_     _|',
      '  | | |   | |     | |   || ||_|| | | | |   ||   ||   |_| ||   _   |  |   |    |   |  ',
      '  |_|  |__|  |___|  |___||_|   |_| |_|  |__||___||_______||__| |__|  |___|    |___|  ',
      '',
      '',
   },
   Sunday = {
      '                   _                      _         __     __        ',
      '     ____  _   __ (_)____ ___     ____   (_)____ _ / /_   / /_ __  __',
      '    / __ \\| | / // // __ `__ \\   / __ \\ / // __ `// __ \\ / __// / / /',
      '   / / / /| |/ // // / / / / /  / / / // // /_/ // / / // /_ / /_/ / ',
      '  /_/ /_/ |___//_//_/ /_/ /_/  /_/ /_//_/ \\__, //_/ /_/ \\__/ \\__, /  ',
      '                                         /____/             /____/   ',
      '',
      '',
   },
}

local dashboardFooters = {
   Monday = {
      "((",
      "\\\\``.",
      "\\_`.``-.",
      "( `.`.` `._",
      " `._`-.    `._",
      "   \\`--.   ,' `.",
      "    `--._  `.  .`.",
      "     `--.--- `. ` `.",
      "         `.--  `;  .`._",
      "           :-   :   ;. `.__,.,__ __",
      "            `\\  :       ,-(     ';o`>.",
      "              `-.`:   ,'   `._ .:  (,-`,",
      "                 \\    ;      ;.  ,:",
      "             ,\"`-._>-:        ;,'  `---.,---.",
      "             `>'\"  \"-`       ,'   \"\":::::\".. `-.",
      "              `;\"'_,  (\\`\\ _ `:::::::::::'\"     `---.",
      "      -hrr-    `-(_,' -'),)\\`.       _      .::::\"'  `----._,-\"\")",
      "                   \\_,': `.-' `-----' `--;-.   `.   ``.`--.____/",
      "                     `-^--'                \\(-.  `.``-.`-=:-.__)",
      "                                            `  `.`.`._`.-._`--.)",
      "                                                 `-^---^--.`--",
      "",
      '                                            _ __ __',
      '                 _ _   _/   _   _/   _  _  \'//_ /_ ',
      '                / / //_//_//_ /_//_// //_//_._/._/ ',
      '                                       _/          ',
      "",
   },
   Tuesday = {
      "                                                          ,-,",
      "                                                        ,',' `,",
      "                                                      ,' , ,','",
      "                                                    ,' ,'  ,'",
      "                                                  ,' ,', ,'",
      "                                                ,'  , ,,'",
      "                                              ,' ,', ,'",
      "                                            ,' , , ,'",
      "                                        __,',___','",
      "                     __,,,,,,,------\"\"\"\"_    __,-\"\"\"\"\"_`=--\",",
      "      _..---.____.--'''''''''''_,---'  _; --'  ___,-'___",
      "    ,':::::,--.::'''''' ''''''' ___,--'   __,-';    __,-\"\"\"\",",
      "   ;:::::,'   |::'' '''' '===)-' __; _,--'    ;---''",
      "  |:: @,'    ;:;\\ ''''==== =),--'_,-'   ` )) ;",
      "  `:::'    _;:/  `._=== ===)_,-,-' `  )  `  ;",
      "   | ;--.;:::; `    `-._=_)_.-'   `  `  )  /`-._",
      "   '        `-:.  `         `    `  ) )  ,'`-.. \\\\",
      "               `:_ `    `        )    _,'     | :",
      "                  `-._    `  _--  _,-'        | :",
      "                      `----..\\  \\'            | |",
      "                             _\\  \\            | :",
      "  _____                 _,--'__,-'            : :      _______",
      " ()___ '-------.....__,'_ --'___________ _,--'--\\-''''  _____",
      "      `-------.....______\\\\______ _________,--._-'---''''",
      "                      `=='",
      "",
      '                                   _  __ __ ',
      '                  _  _/  _ _/    _ _)/_ /_  ',
      '                 //)(/(/( (/(//)(//____)__) ',
      '                               _/           ',
      '',
   },
   Wednesday = {
      "                                           ___     _,-----._",
      "                     _________          ,-'   `.--'   __    `.",
      "                 _,-'--  __,--`-._     ,'  ,(0);___,-'  `-----|",
      "              ,-'  -- ,-'         `._,-'  `'~~``.__,-'~~~~~`-.;",
      "            ,'---  --:             ;     ,' ~`' ;            `",
      "         _,-.------  `._            :   ,'   _,-'",
      "      ,-'    ~~~~~~~`.__`._        ;  _,' _,'",
      "      ;---'~~~~~~~~_,----.___     ,(   _,'",
      "     ,'-- __,---'~~~/ _,-._  `----'_;-'",
      "   ,' `,-'`.  (    / /____ `------'",
      "   `-'~    ;  :  ,{_______`--.__`.`-.-----------.____",
      "          ,' ,' : |       `--.::; ;;;___________     `,",
      "          :  ;  | ;      /   ;;;/--'            `-----",
      "  _______|  |  : ;______/ __/",
      "  ______:  : ,','________/",
      "       |  | : |",
      "      :  : : |",
      "     |  | | ;",
      "     ; :  ;,'",
      "     ;_;`-'",
      '                                        _   _  _  ',
      '       ._ _   _|      _  _|     ._   _   ) |_ |_  ',
      '       | | | (_| |_| (_ (_| |_| | | (_| /_  _) _) ',
      '                                     _|           ',
      '',
      '',
      '',
      '',
      '',
   },
   Thursday = {
      "--",
      "  /                        _.--._ _.---.__",
      " /                       .'  .-.'__.-----.\\",
      "J                       /    `-'(__--'",
      "|                     .'       `. _ `--._",
      "|                    /            .`--'''`",
      "|                   /           .'   d88bd db od8",
      "|                _.'-.         J    dP'`Y8 YP  88",
      "L               /    J         F    88         88",
      "J             .'     F        J     Y8b.  od8  88 Y88P Y88P d8b dbd88b",
      " L           /      /         /-.    Y88b  88  88  Y8   8P d8 8b 88P '",
      "J           /      /         /   \\    `Y8b 88  88  `8. .8' 88d88 88",
      "|          /      /         J    |      88 88  88   Yb dP  88    88",
      "|         /      /          /   /   8b..8P 88  88    8.8   Y8b d 88",
      "|        /   /  /          J   /    PY88P o88oo88o   `8'    Y88Po88o",
      "|       /   /  /           /-'/",
      "|      /   / -'           /  /    Y8888b",
      "|     J   / /            / .'      88  8b",
      "|     / -'-'   /        /-'        88  8P",
      "L    (/|      |        /           88 dP    d8b Y88P Y88P d8b od8.db",
      "J     /.'   ) | _.--  /            8888    8P 8b Y8   8P d8 8b 888P8b",
      " L   //     < \\/   (  |            88 8b    d888 `8. .8' 88d88 88  88",
      " J  //       `.\\    `.`.           88 88   dP 88  Yb dP  88    88  88",
      "  \\//     ___/_\\ `-.__`.`._.----'' 88  8b  8b 88   8.8   Y8b d 88  88",
      "   `.----'      )|`.\\)  `-))\\-')  o88o o8boY8888o  `8'    Y88Po88o 88o",
      "                '   )     ')/",
      "                           '",
   },
   Friday = {
      "                             _..._",
      "                            \\_.._ `'-.,--,",
      "                             '-._'-.  `\\a\\\\",
      "                                 '. `_.' (|",
      "                                   `7    ||",
      "                                   /   .' |",
      "                                  /_.-'  ,J",
      "                                 /         \\",
      "                                ||   /      ;",
      "                     _..        ||  |       |  /`\\.-.",
      "                   .' _ `\\      `\\  \\       |  \\_/__/",
      "                  /  /e)-,\\       '. \\      /.-` .'\\",
      "                 /  |  ,_ |        /\\ `;_.-'_.-'`\\_/",
      "                /   '-(-.)/        \\_;(((_.-;",
      "              .'--.   \\  `       .(((_,;`'.  \\",
      "             /    `\\   |   _.--'`__.'  `\\  '-;\\",
      "           /`       |  /.-'  .--'        '._.'\\\\",
      "         .'        ;  /__.-'`             |  \\  |",
      "       .'`-'_     /_.')))                  \\_\\,_/",
      "      / -'_.'---;`'-)))",
      "     (__.'/   /` .'`",
      "      (_.'/ /` /`",
      "        _|.' /`",
      "     .-` __.'|",
      "      .-'||  |",
      "         \\_`/",
      "           `",
      "",
      "",
      "",
   },
   Saturday = {
      "            ,---,_",
      "         ,'\" -o.  `.",
      "        (,----      `.",
      "             \\        \\",
      "             ;      __ --._",
      "           ,\" \\` \\`-`,--._ `.",
      "          /     ` ` /        `.",
      "         : (       (           \\",
      "         :  \\       \\           \\",
      "          \\  \\       \\           \\",
      "           \\  \\     , \\.          ;",
      "            \\  \\   :   `:.        |",
      "             `. \\  :    `::.     ,|",
      "               ` \\  \\     \\ `---'  \\",
      "                  :-|\\  __ `. `.`.  \\",
      "                  | | `| \\\"\" `       \\",
      "    __,------- ,--; |,-' |\\_.__\\      \\",
      "  -\"          (  / (  /- |__    `. `-.'",
      "  ----\"\"\"\"\"\"`----.__`_`     `-._  `-'",
      "                      `--.__    `-.",
      "                            `-.    `.",
      "                               `.",
      "",
      "",
      '          .        .          _,._,._, ',
      '   ._ _  _|. . _. _|. .._  _ \'_)|_ |_  ',
      '   [ | )(_](_|(_.(_](_|[ )(_]/_.._)._) ',
      '                          ._|          ',
      "",
   },
   Sunday = {
      "                                                         ...  ",
      "                                                      ,:::::-_", 
      "                                                     ,':::::::::.",
      "                                                 _,-'`:::,::(o)::`-,.._",
      "                                               _.', ', `:::::::::;'-..__`.",
      "                                         _.-'' ' ,' ,' ,\\:::,'::-`'''",
      "                                     _.-'' , ' , ,'  ' ,' `:::/",
      "                               _..-'' , ' , ' ,' , ,' ',' '/::",
      "                       _...:::'`-..'_, ' , ,'  , ' ,'' , ,'::|",
      "                    _`.:::::,':::::,'::`-:..'_',_'_,'..-'::,'|",
      "            _..-:::'::,':::::::,':::,':,'::,':::,'::::::,':::;",
      "              `':,'::::::,:,':::::::::::::::::':::,'::_:::,'/",
      "              __..:'::,':::::::--''' `-:,':,':::'::-' ,':::/",
      "         _.::::::,:::.-''-`-`..'_,'. ,',  , ' , ,'  ', `','",
      "       ,::SSt:''''`                 \\:. . ,' '  ,',' '_,'",
      "                                     ``::._,'_'_,',.-'",
      "                                         \\\\ \\\\",
      "                                          \\\\_\\\\",
      "                                           \\\\`-`.-'_",
      "                                        .`-.\\\\__`. ``",
      "                                           ``-.-._",
      "                                               `",
      "",
      '                 __                  __                       ______  ______  ______ ',
      '   .--------..--|  |.--.--..----..--|  |.--.--..-----..-----.|__    ||    __||    __|',
      '   |        ||  _  ||  |  ||  __||  _  ||  |  ||     ||  _  ||    __||__    ||__    |',
      '   |__|__|__||_____||_____||____||_____||_____||__|__||___  ||______||______||______|',
      '                                                      |_____|                        ',
      "",
      "",
      "",
      "",
   },
}

vim.g.dashboard_custom_header = dashboardHeaders[os.date('%A')]
vim.g.dashboard_custom_footer = dashboardFooters[os.date('%A')]
