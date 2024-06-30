

local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local RunService = game:GetService("RunService")
local LocalPlayer = game:GetService("Players").LocalPlayer
local Mouse = LocalPlayer:GetMouse()
local HttpService = game:GetService("HttpService")

local OrionLib = {
	Elements = {},
	ThemeObjects = {},
	Connections = {},
	Flags = {},
	Themes = {
		Default = {
			Main = Color3.fromRGB(25, 25, 25),
			Second = Color3.fromRGB(32, 32, 32),
			Stroke = Color3.fromRGB(60, 60, 60),
			Divider = Color3.fromRGB(60, 60, 60),
			Text = Color3.fromRGB(240, 240, 240),
			TextDark = Color3.fromRGB(150, 150, 150)
		}
	},
	SelectedTheme = "Default",
	Folder = nil,
	SaveCfg = false
}

--Feather Icons https://github.com/evoincorp/lucideblox/tree/master/src/modules/util - Created by 7kayoh
local Icons = {}

local Success, Response = pcall(function()
	Icons = HttpService:JSONDecode([[{
    "aperture": "rbxassetid://7733666258",
    "bug": "rbxassetid://7733701545",
    "chevrons-down-up": "rbxassetid://7733720483",
    "clock-6": "rbxassetid://8997384977",
    "egg": "rbxassetid://8997385940",
    "external-link": "rbxassetid://7743866903",
    "lightbulb-off": "rbxassetid://7733975123",
    "file-check-2": "rbxassetid://7733779610",
    "settings": "rbxassetid://7734053495",
    "crown": "rbxassetid://7733765398",
    "coins": "rbxassetid://7743866529",
    "battery": "rbxassetid://7733674820",
    "flashlight-off": "rbxassetid://7733798799",
    "camera-off": "rbxassetid://7733919260",
    "function-square": "rbxassetid://7733799682",
    "mountain-snow": "rbxassetid://7743870286",
    "gamepad": "rbxassetid://7733799901",
    "gift": "rbxassetid://7733946818",
    "globe": "rbxassetid://7733954760",
    "option": "rbxassetid://7734021300",
    "hand": "rbxassetid://7733955740",
    "hard-hat": "rbxassetid://7733955850",
    "hash": "rbxassetid://7733955906",
    "server": "rbxassetid://7734053426",
    "align-horizontal-space-around": "rbxassetid://8997381738",
    "highlighter": "rbxassetid://7743868648",
    "bike": "rbxassetid://7733678330",
    "home": "rbxassetid://7733960981",
    "image": "rbxassetid://7733964126",
    "indent": "rbxassetid://7733964452",
    "infinity": "rbxassetid://7733964640",
    "inspect": "rbxassetid://7733964808",
    "alert-triangle": "rbxassetid://7733658504",
    "align-start-horizontal": "rbxassetid://8997381965",
    "figma": "rbxassetid://7743867310",
    "pin": "rbxassetid://8997386648",
    "corner-up-right": "rbxassetid://7733764915",
    "list-x": "rbxassetid://7743869517",
    "monitor-off": "rbxassetid://7734000184",
    "chevron-first": "rbxassetid://8997383275",
    "package-search": "rbxassetid://8997386448",
    "pencil": "rbxassetid://7734022107",
    "cloud-fog": "rbxassetid://7733920317",
    "grip-horizontal": "rbxassetid://7733955302",
    "align-center-vertical": "rbxassetid://8997380737",
    "outdent": "rbxassetid://7734021384",
    "more-vertical": "rbxassetid://7734006187",
    "package-plus": "rbxassetid://8997386355",
    "bluetooth": "rbxassetid://7733687147",
    "pen-tool": "rbxassetid://7734022041",
    "person-standing": "rbxassetid://7743871002",
    "tornado": "rbxassetid://7743873633",
    "phone-incoming": "rbxassetid://7743871120",
    "phone-off": "rbxassetid://7734029534",
    "dribbble": "rbxassetid://7733770843",
    "at-sign": "rbxassetid://7733673907",
    "edit-2": "rbxassetid://7733771217",
    "sheet": "rbxassetid://7743871876",
    "tv": "rbxassetid://7743874674",
    "headphones": "rbxassetid://7733956063",
    "qr-code": "rbxassetid://7743871575",
    "reply": "rbxassetid://7734051594",
    "rewind": "rbxassetid://7734051670",
    "bell-off": "rbxassetid://7733675107",
    "file-check": "rbxassetid://7733779668",
    "quote": "rbxassetid://7734045100",
    "rotate-ccw": "rbxassetid://7734051861",
    "library": "rbxassetid://7743869054",
    "clock-1": "rbxassetid://8997383694",
    "on-charge": "rbxassetid://7734021231",
    "video-off": "rbxassetid://7743876466",
    "save": "rbxassetid://7734052335",
    "arrow-left-circle": "rbxassetid://7733673056",
    "screen-share": "rbxassetid://7734052814",
    "clock-3": "rbxassetid://8997384456",
    "help-circle": "rbxassetid://7733956210",
    "server-crash": "rbxassetid://7734053281",
    "bluetooth-searching": "rbxassetid://7733914320",
    "equal": "rbxassetid://7733771811",
    "shield-close": "rbxassetid://7734056470",
    "phone": "rbxassetid://7734032056",
    "type": "rbxassetid://7743874740",
    "file-x-2": "rbxassetid://7743867554",
    "sidebar": "rbxassetid://7734058260",
    "sigma": "rbxassetid://7734058345",
    "smartphone-charging": "rbxassetid://7734058894",
    "arrow-left": "rbxassetid://7733673136",
    "framer": "rbxassetid://7733799486",
    "currency": "rbxassetid://7733765592",
    "star": "rbxassetid://7734068321",
    "stretch-horizontal": "rbxassetid://8997387754",
    "smile": "rbxassetid://7734059095",
    "subscript": "rbxassetid://8997387937",
    "sun": "rbxassetid://7734068495",
    "switch-camera": "rbxassetid://7743872492",
    "table": "rbxassetid://7734073253",
    "tag": "rbxassetid://7734075797",
    "cross": "rbxassetid://7733765224",
    "gem": "rbxassetid://7733942651",
    "link": "rbxassetid://7733978098",
    "terminal": "rbxassetid://7743872929",
    "thermometer-sun": "rbxassetid://7734084018",
    "share-2": "rbxassetid://7734053595",
    "timer-off": "rbxassetid://8997388325",
    "megaphone": "rbxassetid://7733993049",
    "timer-reset": "rbxassetid://7743873336",
    "phone-forwarded": "rbxassetid://7734027345",
    "unlock": "rbxassetid://7743875263",
    "trello": "rbxassetid://7743873996",
    "camera": "rbxassetid://7733708692",
    "triangle": "rbxassetid://7743874367",
    "truck": "rbxassetid://7743874482",
    "file-output": "rbxassetid://7733788742",
    "gamepad-2": "rbxassetid://7733799795",
    "network": "rbxassetid://7734021047",
    "users": "rbxassetid://7743876054",
    "electricity-off": "rbxassetid://7733771563",
    "book": "rbxassetid://7733914390",
    "clock-9": "rbxassetid://8997385485",
    "corner-down-left": "rbxassetid://7733764327",
    "locate-fixed": "rbxassetid://7733992424",
    "bar-chart": "rbxassetid://7733674319",
    "shield-check": "rbxassetid://7734056411",
    "signal-low": "rbxassetid://8997387189",
    "reply-all": "rbxassetid://7734051524",
    "zoom-in": "rbxassetid://7743878977",
    "grip-vertical": "rbxassetid://7733955410",
    "ticket": "rbxassetid://7734086558",
    "smartphone": "rbxassetid://7734058979",
    "arrow-big-right": "rbxassetid://7733671493",
    "tv-2": "rbxassetid://7743874599",
    "flashlight": "rbxassetid://7733798851",
    "database": "rbxassetid://7743866778",
    "plus-square": "rbxassetid://7734040369",
    "align-justify": "rbxassetid://7733661326",
    "clipboard-list": "rbxassetid://7733920117",
    "github": "rbxassetid://7733954058",
    "columns": "rbxassetid://7733757178",
    "arrow-big-down": "rbxassetid://7733668653",
    "cloud-off": "rbxassetid://7733745572",
    "target": "rbxassetid://7743872758",
    "skip-back": "rbxassetid://7734058404",
    "x-circle": "rbxassetid://7743878496",
    "clock-10": "rbxassetid://8997383876",
    "align-right": "rbxassetid://7733663582",
    "clock-5": "rbxassetid://8997384798",
    "bell-plus": "rbxassetid://7733675181",
    "battery-medium": "rbxassetid://7733674731",
    "arrow-down": "rbxassetid://7733672933",
    "inbox": "rbxassetid://7733964370",
    "cast": "rbxassetid://7733919326",
    "gift-card": "rbxassetid://7733945018",
    "webcam": "rbxassetid://7743877896",
    "folder-minus": "rbxassetid://7733799022",
    "scan-line": "rbxassetid://8997386772",
    "shovel": "rbxassetid://7734056878",
    "download-cloud": "rbxassetid://7733770689",
    "list-checks": "rbxassetid://7743869317",
    "file-text": "rbxassetid://7733789088",
    "codesandbox": "rbxassetid://7733752575",
    "laptop-2": "rbxassetid://7733965313",
    "podcast": "rbxassetid://7734042234",
    "log-out": "rbxassetid://7733992677",
    "thumbs-up": "rbxassetid://7743873212",
    "timer": "rbxassetid://7743873443",
    "text-cursor": "rbxassetid://8997388195",
    "file-search": "rbxassetid://7733788966",
    "thermometer": "rbxassetid://7734084149",
    "bluetooth-off": "rbxassetid://7733914252",
    "refresh-cw": "rbxassetid://7734051052",
    "clipboard-check": "rbxassetid://7733919947",
    "languages": "rbxassetid://7733965249",
    "asterisk": "rbxassetid://7733673800",
    "superscript": "rbxassetid://8997388036",
    "user-check": "rbxassetid://7743875503",
    "move-diagonal": "rbxassetid://7743870505",
    "copy": "rbxassetid://7733764083",
    "bot": "rbxassetid://7733916988",
    "alarm-minus": "rbxassetid://7733656164",
    "log-in": "rbxassetid://7733992604",
    "maximize": "rbxassetid://7733992982",
    "align-horizontal-space-between": "rbxassetid://8997381854",
    "brush": "rbxassetid://7733701455",
    "equal-not": "rbxassetid://7733771726",
    "upload": "rbxassetid://7743875428",
    "minus-circle": "rbxassetid://7733998053",
    "graduation-cap": "rbxassetid://7733955058",
    "edit-3": "rbxassetid://7733771361",
    "check": "rbxassetid://7733715400",
    "scissors": "rbxassetid://7734052570",
    "info": "rbxassetid://7733964719",
    "align-horizonal-distribute-start": "rbxassetid://8997381290",
    "book-open": "rbxassetid://7733687281",
    "divide-circle": "rbxassetid://7733769152",
    "file": "rbxassetid://7733793319",
    "clock-2": "rbxassetid://8997384295",
    "corner-right-up": "rbxassetid://7733764680",
    "clover": "rbxassetid://7733747233",
    "expand": "rbxassetid://7733771982",
    "gauge": "rbxassetid://7733799969",
    "phone-outgoing": "rbxassetid://7743871253",
    "shield-alert": "rbxassetid://7734056326",
    "paperclip": "rbxassetid://7734021680",
    "arrow-big-left": "rbxassetid://7733911731",
    "album": "rbxassetid://7733658133",
    "bookmark": "rbxassetid://7733692043",
    "check-circle-2": "rbxassetid://7733710700",
    "list-ordered": "rbxassetid://7743869411",
    "delete": "rbxassetid://7733768142",
    "axe": "rbxassetid://7733674079",
    "radio": "rbxassetid://7743871662",
    "octagon": "rbxassetid://7734021165",
    "git-commit": "rbxassetid://7743868360",
    "shirt": "rbxassetid://7734056672",
    "corner-right-down": "rbxassetid://7733764605",
    "trending-down": "rbxassetid://7743874143",
    "airplay": "rbxassetid://7733655834",
    "repeat": "rbxassetid://7734051454",
    "layers": "rbxassetid://7743868936",
    "chevron-right": "rbxassetid://7733717755",
    "chevrons-right": "rbxassetid://7733919682",
    "folder-plus": "rbxassetid://7733799092",
    "alarm-check": "rbxassetid://7733655912",
    "arrow-up-right": "rbxassetid://7733673646",
    "user-plus": "rbxassetid://7743875759",
    "file-minus": "rbxassetid://7733936115",
    "cloud-drizzle": "rbxassetid://7733920226",
    "stretch-vertical": "rbxassetid://8997387862",
    "align-vertical-distribute-start": "rbxassetid://8997382428",
    "unlink": "rbxassetid://7743875149",
    "wand": "rbxassetid://8997388430",
    "regex": "rbxassetid://7734051188",
    "command": "rbxassetid://7733924046",
    "haze": "rbxassetid://7733955969",
    "trash": "rbxassetid://7743873871",
    "battery-full": "rbxassetid://7733674503",
    "flag-triangle-left": "rbxassetid://7733798509",
    "server-off": "rbxassetid://7734053361",
    "loader-2": "rbxassetid://7733989869",
    "monitor-speaker": "rbxassetid://7743869988",
    "shuffle": "rbxassetid://7734057059",
    "tablet": "rbxassetid://7743872620",
    "cloud-moon": "rbxassetid://7733920519",
    "clipboard-x": "rbxassetid://7733734668",
    "pocket": "rbxassetid://7734042139",
    "watch": "rbxassetid://7743877668",
    "file-plus": "rbxassetid://7733788885",
    "locate": "rbxassetid://7733992469",
    "share": "rbxassetid://7734053697",
    "thermometer-snowflake": "rbxassetid://7743873074",
    "volume-1": "rbxassetid://7743877081",
    "arrow-left-right": "rbxassetid://8997382869",
    "coffee": "rbxassetid://7733752630",
    "chevron-last": "rbxassetid://8997383390",
    "cloud-hail": "rbxassetid://7733920444",
    "alarm-clock-off": "rbxassetid://7733656003",
    "pound-sterling": "rbxassetid://7734042354",
    "tent": "rbxassetid://7734078943",
    "toggle-left": "rbxassetid://7734091286",
    "dollar-sign": "rbxassetid://7733770599",
    "sunrise": "rbxassetid://7743872365",
    "sunset": "rbxassetid://7734070982",
    "code": "rbxassetid://7733749837",
    "thumbs-down": "rbxassetid://7734084236",
    "trending-up": "rbxassetid://7743874262",
    "clock-12": "rbxassetid://8997384150",
    "rocking-chair": "rbxassetid://7734051769",
    "check-square": "rbxassetid://7733919526",
    "cpu": "rbxassetid://7733765045",
    "palette": "rbxassetid://7734021595",
    "minimize-2": "rbxassetid://7733997870",
    "cloud-sun": "rbxassetid://7733746880",
    "copyleft": "rbxassetid://7733764196",
    "archive": "rbxassetid://7733911621",
    "building": "rbxassetid://7733701625",
    "image-minus": "rbxassetid://7733963797",
    "italic": "rbxassetid://7733964917",
    "link-2-off": "rbxassetid://7733975283",
    "sort-asc": "rbxassetid://7734060715",
    "underline": "rbxassetid://7743874904",
    "gitlab": "rbxassetid://7733954246",
    "file-minus-2": "rbxassetid://7733936010",
    "play-circle": "rbxassetid://7734037784",
    "clock-8": "rbxassetid://8997385352",
    "file-input": "rbxassetid://7733935917",
    "beaker": "rbxassetid://7733674922",
    "shopping-bag": "rbxassetid://7734056747",
    "navigation": "rbxassetid://7734020989",
    "moon": "rbxassetid://7743870134",
    "align-vertical-space-between": "rbxassetid://8997382793",
    "glasses": "rbxassetid://7733954403",
    "clipboard-copy": "rbxassetid://7733920037",
    "feather": "rbxassetid://7733777166",
    "skip-forward": "rbxassetid://7734058495",
    "wind": "rbxassetid://7743878264",
    "frown": "rbxassetid://7733799591",
    "move-vertical": "rbxassetid://7743870608",
    "umbrella": "rbxassetid://7743874820",
    "package": "rbxassetid://7734021469",
    "chevrons-up": "rbxassetid://7733723433",
    "download": "rbxassetid://7733770755",
    "eye": "rbxassetid://7733774602",
    "files": "rbxassetid://7743867811",
    "arrow-down-right": "rbxassetid://7733672831",
    "code-2": "rbxassetid://7733920644",
    "wrap-text": "rbxassetid://8997388548",
    "file-digit": "rbxassetid://7733935829",
    "x-square": "rbxassetid://7743878737",
    "clipboard": "rbxassetid://7733734762",
    "maximize-2": "rbxassetid://7733992901",
    "send": "rbxassetid://7734053039",
    "alarm-clock": "rbxassetid://7733656100",
    "sliders": "rbxassetid://7734058803",
    "refresh-ccw": "rbxassetid://7734050715",
    "music": "rbxassetid://7734020554",
    "banknote": "rbxassetid://7733674153",
    "hard-drive": "rbxassetid://7733955793",
    "search": "rbxassetid://7734052925",
    "layout-list": "rbxassetid://7733970442",
    "edit": "rbxassetid://7733771472",
    "contrast": "rbxassetid://7733764005",
    "wifi": "rbxassetid://7743878148",
    "swiss-franc": "rbxassetid://7734071038",
    "ghost": "rbxassetid://7743868000",
    "laptop": "rbxassetid://7733965386",
    "clock-4": "rbxassetid://8997384603",
    "layout-dashboard": "rbxassetid://7733970318",
    "align-vertical-justify-end": "rbxassetid://8997382584",
    "circle": "rbxassetid://7733919881",
    "file-x": "rbxassetid://7733938136",
    "award": "rbxassetid://7733673987",
    "corner-left-down": "rbxassetid://7733764448",
    "arrow-up-left": "rbxassetid://7733673539",
    "carrot": "rbxassetid://8997382987",
    "globe-2": "rbxassetid://7733954611",
    "compass": "rbxassetid://7733924216",
    "git-branch": "rbxassetid://7733949149",
    "vibrate": "rbxassetid://7743876302",
    "pause-circle": "rbxassetid://7734021767",
    "minus-square": "rbxassetid://7743869899",
    "mic-off": "rbxassetid://7743869714",
    "arrow-down-circle": "rbxassetid://7733671763",
    "move-horizontal": "rbxassetid://7734016210",
    "chrome": "rbxassetid://7733919783",
    "radio-receiver": "rbxassetid://7734045155",
    "shield": "rbxassetid://7734056608",
    "image-plus": "rbxassetid://7733964016",
    "more-horizontal": "rbxassetid://7734006080",
    "slash": "rbxassetid://8997387644",
    "divide": "rbxassetid://7733769365",
    "view": "rbxassetid://7743876754",
    "list": "rbxassetid://7743869612",
    "printer": "rbxassetid://7734042580",
    "corner-left-up": "rbxassetid://7733764536",
    "meh": "rbxassetid://7733993147",
    "copyright": "rbxassetid://7733764275",
    "align-end-vertical": "rbxassetid://8997380907",
    "heart": "rbxassetid://7733956134",
    "lock": "rbxassetid://7733992528",
    "align-center": "rbxassetid://7733909776",
    "signal-high": "rbxassetid://8997387110",
    "upload-cloud": "rbxassetid://7743875358",
    "arrow-up-circle": "rbxassetid://7733673466",
    "git-branch-plus": "rbxassetid://7743868200",
    "align-vertical-justify-center": "rbxassetid://8997382502",
    "screen-share-off": "rbxassetid://7734052653",
    "git-pull-request": "rbxassetid://7733952287",
    "flag": "rbxassetid://7733798691",
    "star-half": "rbxassetid://7734068258",
    "minus": "rbxassetid://7734000129",
    "mountain": "rbxassetid://7734008868",
    "volume": "rbxassetid://7743877487",
    "mouse-pointer-2": "rbxassetid://7734010405",
    "package-x": "rbxassetid://8997386545",
    "indian-rupee": "rbxassetid://7733964536",
    "speaker": "rbxassetid://7734063416",
    "flame": "rbxassetid://7733798747",
    "circle-slashed": "rbxassetid://8997383530",
    "crop": "rbxassetid://7733765140",
    "clock-11": "rbxassetid://8997384034",
    "stop-circle": "rbxassetid://7734068379",
    "align-horizontal-justify-end": "rbxassetid://8997381549",
    "power-off": "rbxassetid://7734042423",
    "bell-minus": "rbxassetid://7733675028",
    "undo": "rbxassetid://7743874974",
    "link-2": "rbxassetid://7743869163",
    "lightbulb": "rbxassetid://7733975185",
    "shrink": "rbxassetid://7734056971",
    "mail": "rbxassetid://7733992732",
    "pause": "rbxassetid://7734021897",
    "bold": "rbxassetid://7733687211",
    "calendar": "rbxassetid://7733919198",
    "x-octagon": "rbxassetid://7743878618",
    "russian-ruble": "rbxassetid://7734052248",
    "file-code": "rbxassetid://7733779730",
    "life-buoy": "rbxassetid://7733973479",
    "import": "rbxassetid://7733964240",
    "video": "rbxassetid://7743876610",
    "clock-7": "rbxassetid://8997385147",
    "align-center-horizontal": "rbxassetid://8997380477",
    "bell": "rbxassetid://7733911828",
    "move-diagonal-2": "rbxassetid://7734013178",
    "message-circle": "rbxassetid://7733993311",
    "skull": "rbxassetid://7734058599",
    "battery-charging": "rbxassetid://7733674402",
    "ruler": "rbxassetid://7734052157",
    "binary": "rbxassetid://7733678388",
    "cloud-rain-wind": "rbxassetid://7733746456",
    "briefcase": "rbxassetid://7733919017",
    "terminal-square": "rbxassetid://7734079055",
    "scale": "rbxassetid://7734052454",
    "lasso": "rbxassetid://7733967892",
    "piggy-bank": "rbxassetid://7734034513",
    "battery-low": "rbxassetid://7733674589",
    "arrow-up": "rbxassetid://7733673717",
    "list-plus": "rbxassetid://7733984995",
    "bookmark-plus": "rbxassetid://7734111084",
    "box-select": "rbxassetid://7733696665",
    "filter": "rbxassetid://7733798407",
    "play": "rbxassetid://7743871480",
    "align-vertical-space-around": "rbxassetid://8997382708",
    "calculator": "rbxassetid://7733919105",
    "bell-ring": "rbxassetid://7733675275",
    "plane": "rbxassetid://7734037723",
    "plus-circle": "rbxassetid://7734040271",
    "power": "rbxassetid://7734042493",
    "phone-missed": "rbxassetid://7734029465",
    "percent": "rbxassetid://7743870852",
    "jersey-pound": "rbxassetid://7733965029",
    "mouse-pointer": "rbxassetid://7743870392",
    "box": "rbxassetid://7733917120",
    "separator-vertical": "rbxassetid://7734053213",
    "snowflake": "rbxassetid://7734059180",
    "sort-desc": "rbxassetid://7743871973",
    "flag-triangle-right": "rbxassetid://7733798634",
    "bar-chart-2": "rbxassetid://7733674239",
    "hand-metal": "rbxassetid://7733955664",
    "map": "rbxassetid://7733992829",
    "eye-off": "rbxassetid://7733774495",
    "align-end-horizontal": "rbxassetid://8997380820",
    "cloud-rain": "rbxassetid://7733746651",
    "contact": "rbxassetid://7743866666",
    "signal": "rbxassetid://8997387546",
    "mouse-pointer-click": "rbxassetid://7734010488",
    "settings-2": "rbxassetid://8997386997",
    "sidebar-open": "rbxassetid://7734058165",
    "unlink-2": "rbxassetid://7743875069",
    "pause-octagon": "rbxassetid://7734021827",
    "user-minus": "rbxassetid://7743875629",
    "cloud": "rbxassetid://7733746980",
    "arrow-right-circle": "rbxassetid://7733673229",
    "align-horizonal-distribute-center": "rbxassetid://8997381028",
    "fast-forward": "rbxassetid://7743867090",
    "volume-2": "rbxassetid://7743877250",
    "grab": "rbxassetid://7733954884",
    "arrow-right": "rbxassetid://7733673345",
    "chevron-down": "rbxassetid://7733717447",
    "volume-x": "rbxassetid://7743877381",
    "cloud-snow": "rbxassetid://7733746798",
    "car": "rbxassetid://7733708835",
    "bluetooth-connected": "rbxassetid://7734110952",
    "CD": "rbxassetid://7734110220",
    "cookie": "rbxassetid://8997385628",
    "message-square": "rbxassetid://7733993369",
    "repeat-1": "rbxassetid://7734051342",
    "codepen": "rbxassetid://7733920768",
    "voicemail": "rbxassetid://7743876916",
    "text-cursor-input": "rbxassetid://8997388094",
    "package-check": "rbxassetid://8997386143",
    "shopping-cart": "rbxassetid://7734056813",
    "corner-down-right": "rbxassetid://7733764385",
    "folder-open": "rbxassetid://8997386062",
    "charge": "rbxassetid://8997383136",
    "layout-grid": "rbxassetid://7733970390",
    "clock": "rbxassetid://7733734848",
    "corner-up-left": "rbxassetid://7733764800",
    "align-horizontal-justify-start": "rbxassetid://8997381652",
    "git-merge": "rbxassetid://7733952195",
    "verified": "rbxassetid://7743876142",
    "redo": "rbxassetid://7743871739",
    "hexagon": "rbxassetid://7743868527",
    "square": "rbxassetid://7743872181",
    "align-horizontal-justify-center": "rbxassetid://8997381461",
    "chevrons-up-down": "rbxassetid://7733723321",
    "bus": "rbxassetid://7733701715",
    "file-plus-2": "rbxassetid://7733788816",
    "alarm-plus": "rbxassetid://7733658066",
    "divide-square": "rbxassetid://7733769261",
    "pie-chart": "rbxassetid://7734034378",
    "signal-zero": "rbxassetid://8997387434",
    "hammer": "rbxassetid://7733955511",
    "history": "rbxassetid://7733960880",
    "align-vertical-justify-start": "rbxassetid://8997382639",
    "flask-round": "rbxassetid://7733798957",
    "wifi-off": "rbxassetid://7743878056",
    "zoom-out": "rbxassetid://7743879082",
    "toggle-right": "rbxassetid://7743873539",
    "monitor": "rbxassetid://7734002839",
    "x": "rbxassetid://7743878857",
    "align-horizonal-distribute-end": "rbxassetid://8997381144",
    "user": "rbxassetid://7743875962",
    "sprout": "rbxassetid://7743872071",
    "move": "rbxassetid://7743870731",
    "gavel": "rbxassetid://7733800044",
    "package-minus": "rbxassetid://8997386266",
    "drumstick": "rbxassetid://8997385789",
    "forward": "rbxassetid://7733799371",
    "sidebar-close": "rbxassetid://7734058092",
    "electricity": "rbxassetid://7733771628",
    "plus": "rbxassetid://7734042071",
    "pipette": "rbxassetid://7743871384",
    "cloud-lightning": "rbxassetid://7733741741",
    "lasso-select": "rbxassetid://7743868832",
    "phone-call": "rbxassetid://7734027264",
    "droplet": "rbxassetid://7733770982",
    "key": "rbxassetid://7733965118",
    "map-pin": "rbxassetid://7733992789",
    "navigation-2": "rbxassetid://7734020942",
    "list-minus": "rbxassetid://7733980795",
    "chevron-up": "rbxassetid://7733919605",
    "layout-template": "rbxassetid://7733970494",
    "no_entry": "rbxassetid://7734021118",
    "scan": "rbxassetid://8997386861",
    "arrow-big-up": "rbxassetid://7733671663",
    "bookmark-minus": "rbxassetid://7733689754",
    "activity": "rbxassetid://7733655755",
    "grid": "rbxassetid://7733955179",
    "user-x": "rbxassetid://7743875879",
    "alert-circle": "rbxassetid://7733658271",
    "menu": "rbxassetid://7733993211",
    "form-input": "rbxassetid://7733799275",
    "rss": "rbxassetid://7734052075",
    "loader": "rbxassetid://7733992358",
    "align-vertical-distribute-end": "rbxassetid://8997382326",
    "strikethrough": "rbxassetid://7734068425",
    "mic": "rbxassetid://7743869805",
    "landmark": "rbxassetid://7733965184",
    "crosshair": "rbxassetid://7733765307",
    "alert-octagon": "rbxassetid://7733658335",
    "anchor": "rbxassetid://7733911490",
    "separator-horizontal": "rbxassetid://7734053146",
    "chevron-left": "rbxassetid://7733717651",
    "flask-conical": "rbxassetid://7733798901",
    "wallet": "rbxassetid://7743877573",
    "euro": "rbxassetid://7733771891",
    "trash-2": "rbxassetid://7743873772",
    "check-circle": "rbxassetid://7733919427",
    "layout": "rbxassetid://7733970543",
    "droplets": "rbxassetid://7733771078",
    "align-start-vertical": "rbxassetid://8997382085",
    "rotate-cw": "rbxassetid://7734051957",
    "minimize": "rbxassetid://7733997941",
    "arrow-down-left": "rbxassetid://7733672282",
    "signal-medium": "rbxassetid://8997387319",
    "align-vertical-distribute-center": "rbxassetid://8997382212",
    "image-off": "rbxassetid://7733963907",
    "cloudy": "rbxassetid://7733747106",
    "align-left": "rbxassetid://7733911357",
    "film": "rbxassetid://7733942579",
    "chevrons-down": "rbxassetid://7733720604",
    "pointer": "rbxassetid://7734042307",
    "folder": "rbxassetid://7733799185",
    "chevrons-left": "rbxassetid://7733720701",
    "shield-off": "rbxassetid://7734056540",
    "wrench": "rbxassetid://7743878358"
  }]])
end)

if not Success then
	warn("\nOrion Library - Failed to load Feather Icons. Error code: " .. Response .. "\n")
end	

local function GetIcon(IconName)
	if Icons[IconName] ~= nil then
		return Icons[IconName]
	else
		return nil
	end
end   

local Orion = Instance.new("ScreenGui")
Orion.Name = "Orion" .. math.random(0,10000)
-- if syn then
-- 	syn.protect_gui(Orion)
-- 	Orion.Parent = game.CoreGui
-- else
	Orion.Parent = gethui() or game.CoreGui
-- end

if gethui then
	for _, Interface in ipairs(gethui():GetChildren()) do
		if Interface.Name == Orion.Name and Interface ~= Orion then
			Interface:Destroy()
		end
	end
else
	for _, Interface in ipairs(game.CoreGui:GetChildren()) do
		if Interface.Name == Orion.Name and Interface ~= Orion then
			Interface:Destroy()
		end
	end
end

function OrionLib:IsRunning()
	if gethui then
		return Orion.Parent == gethui()
	else
		return Orion.Parent == game:GetService("CoreGui")
	end

end

local function AddConnection(Signal, Function)
	if (not OrionLib:IsRunning()) then
		return
	end
	local SignalConnect = Signal:Connect(Function)
	table.insert(OrionLib.Connections, SignalConnect)
	return SignalConnect
end

task.spawn(function()
	while (OrionLib:IsRunning()) do
		wait()
	end

	for _, Connection in next, OrionLib.Connections do
		Connection:Disconnect()
	end
end)

local function MakeDraggable(DragPoint, Main)
	pcall(function()
		local Dragging, DragInput, MousePos, FramePos = false
		AddConnection(DragPoint.InputBegan, function(Input)
			if Input.UserInputType == Enum.UserInputType.MouseButton1 then
				Dragging = true
				MousePos = Input.Position
				FramePos = Main.Position

				Input.Changed:Connect(function()
					if Input.UserInputState == Enum.UserInputState.End then
						Dragging = false
					end
				end)
			end
		end)
		AddConnection(DragPoint.InputChanged, function(Input)
			if Input.UserInputType == Enum.UserInputType.MouseMovement then
				DragInput = Input
			end
		end)
		AddConnection(UserInputService.InputChanged, function(Input)
			if Input == DragInput and Dragging then
				local Delta = Input.Position - MousePos
				--TweenService:Create(Main, TweenInfo.new(0.05, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {Position  = UDim2.new(FramePos.X.Scale,FramePos.X.Offset + Delta.X, FramePos.Y.Scale, FramePos.Y.Offset + Delta.Y)}):Play()
				Main.Position  = UDim2.new(FramePos.X.Scale,FramePos.X.Offset + Delta.X, FramePos.Y.Scale, FramePos.Y.Offset + Delta.Y)
			end
		end)
	end)
end    

local function Create(Name, Properties, Children)
	local Object = Instance.new(Name)
	for i, v in next, Properties or {} do
		Object[i] = v
	end
	for i, v in next, Children or {} do
		v.Parent = Object
	end
	return Object
end

local function CreateElement(ElementName, ElementFunction)
	OrionLib.Elements[ElementName] = function(...)
		return ElementFunction(...)
	end
end

local function MakeElement(ElementName, ...)
	local NewElement = OrionLib.Elements[ElementName](...)
	return NewElement
end

local function SetProps(Element, Props)
	table.foreach(Props, function(Property, Value)
		Element[Property] = Value
	end)
	return Element
end

local function SetChildren(Element, Children)
	table.foreach(Children, function(_, Child)
		Child.Parent = Element
	end)
	return Element
end

local function Round(Number, Factor)
	local Result = math.floor(Number/Factor + (math.sign(Number) * 0.5)) * Factor
	if Result < 0 then Result = Result + Factor end
	return Result
end

local function ReturnProperty(Object)
	if Object:IsA("Frame") or Object:IsA("TextButton") then
		return "BackgroundColor3"
	end 
	if Object:IsA("ScrollingFrame") then
		return "ScrollBarImageColor3"
	end 
	if Object:IsA("UIStroke") then
		return "Color"
	end 
	if Object:IsA("TextLabel") or Object:IsA("TextBox") then
		return "TextColor3"
	end   
	if Object:IsA("ImageLabel") or Object:IsA("ImageButton") then
		return "ImageColor3"
	end   
end

local function AddThemeObject(Object, Type)
	if not OrionLib.ThemeObjects[Type] then
		OrionLib.ThemeObjects[Type] = {}
	end    
	table.insert(OrionLib.ThemeObjects[Type], Object)
	Object[ReturnProperty(Object)] = OrionLib.Themes[OrionLib.SelectedTheme][Type]
	return Object
end    

local function SetTheme()
	for Name, Type in pairs(OrionLib.ThemeObjects) do
		for _, Object in pairs(Type) do
			Object[ReturnProperty(Object)] = OrionLib.Themes[OrionLib.SelectedTheme][Name]
		end    
	end    
end

local function PackColor(Color)
	return {R = Color.R * 255, G = Color.G * 255, B = Color.B * 255}
end    

local function UnpackColor(Color)
	return Color3.fromRGB(Color.R, Color.G, Color.B)
end

local function LoadCfg(Config)
	local Data = HttpService:JSONDecode(Config)
	table.foreach(Data, function(a,b)
		if OrionLib.Flags[a] then
			spawn(function() 
				if OrionLib.Flags[a].Type == "Colorpicker" then
					OrionLib.Flags[a]:Set(UnpackColor(b))
				else
					OrionLib.Flags[a]:Set(b)
				end    
			end)
		else
			warn("Orion Library Config Loader - Could not find ", a ,b)
		end
	end)
end

local function SaveCfg(Name)
	local Data = {}
	for i,v in pairs(OrionLib.Flags) do
		if v.Save then
			if v.Type == "Colorpicker" then
				Data[i] = PackColor(v.Value)
			else
				Data[i] = v.Value
			end
		end	
	end
	writefile(OrionLib.Folder .. "/" .. Name .. ".txt", tostring(HttpService:JSONEncode(Data)))
end

local WhitelistedMouse = {Enum.UserInputType.MouseButton1, Enum.UserInputType.MouseButton2,Enum.UserInputType.MouseButton3}
local BlacklistedKeys = {Enum.KeyCode.Unknown,Enum.KeyCode.W,Enum.KeyCode.A,Enum.KeyCode.S,Enum.KeyCode.D,Enum.KeyCode.Up,Enum.KeyCode.Left,Enum.KeyCode.Down,Enum.KeyCode.Right,Enum.KeyCode.Slash,Enum.KeyCode.Tab,Enum.KeyCode.Backspace,Enum.KeyCode.Escape}

local function CheckKey(Table, Key)
	for _, v in next, Table do
		if v == Key then
			return true
		end
	end
end

CreateElement("Corner", function(Scale, Offset)
	local Corner = Create("UICorner", {
		CornerRadius = UDim.new(Scale or 0, Offset or 10)
	})
	return Corner
end)

CreateElement("Stroke", function(Color, Thickness)
	local Stroke = Create("UIStroke", {
		Color = Color or Color3.fromRGB(255, 255, 255),
		Thickness = Thickness or 1
	})
	return Stroke
end)

CreateElement("List", function(Scale, Offset)
	local List = Create("UIListLayout", {
		SortOrder = Enum.SortOrder.LayoutOrder,
		Padding = UDim.new(Scale or 0, Offset or 0)
	})
	return List
end)

CreateElement("Padding", function(Bottom, Left, Right, Top)
	local Padding = Create("UIPadding", {
		PaddingBottom = UDim.new(0, Bottom or 4),
		PaddingLeft = UDim.new(0, Left or 4),
		PaddingRight = UDim.new(0, Right or 4),
		PaddingTop = UDim.new(0, Top or 4)
	})
	return Padding
end)

CreateElement("TFrame", function()
	local TFrame = Create("Frame", {
		BackgroundTransparency = 1
	})
	return TFrame
end)

CreateElement("Frame", function(Color)
	local Frame = Create("Frame", {
		BackgroundColor3 = Color or Color3.fromRGB(255, 255, 255),
		BorderSizePixel = 0
	})
	return Frame
end)

CreateElement("RoundFrame", function(Color, Scale, Offset)
	local Frame = Create("Frame", {
		BackgroundColor3 = Color or Color3.fromRGB(255, 255, 255),
		BorderSizePixel = 0
	}, {
		Create("UICorner", {
			CornerRadius = UDim.new(Scale, Offset)
		})
	})
	return Frame
end)

CreateElement("Button", function()
	local Button = Create("TextButton", {
		Text = "",
		AutoButtonColor = false,
		BackgroundTransparency = 1,
		BorderSizePixel = 0
	})
	return Button
end)

CreateElement("ScrollFrame", function(Color, Width)
	local ScrollFrame = Create("ScrollingFrame", {
		BackgroundTransparency = 1,
		MidImage = "rbxassetid://7445543667",
		BottomImage = "rbxassetid://7445543667",
		TopImage = "rbxassetid://7445543667",
		ScrollBarImageColor3 = Color,
		BorderSizePixel = 0,
		ScrollBarThickness = Width,
		CanvasSize = UDim2.new(0, 0, 0, 0)
	})
	return ScrollFrame
end)

CreateElement("Image", function(ImageID)
	local ImageNew = Create("ImageLabel", {
		Image = ImageID,
		BackgroundTransparency = 1
	})

	if GetIcon(ImageID) ~= nil then
		ImageNew.Image = GetIcon(ImageID)
	end	

	return ImageNew
end)

CreateElement("ImageButton", function(ImageID)
	local Image = Create("ImageButton", {
		Image = ImageID,
		BackgroundTransparency = 1
	})
	return Image
end)

CreateElement("Label", function(Text, TextSize, Transparency)
	local Label = Create("TextLabel", {
		Text = Text or "",
		TextColor3 = Color3.fromRGB(240, 240, 240),
		TextTransparency = Transparency or 0,
		TextSize = TextSize or 15,
		Font = Enum.Font.Gotham,
		RichText = true,
		BackgroundTransparency = 1,
		TextXAlignment = Enum.TextXAlignment.Left
	})
	return Label
end)

local NotificationHolder = SetProps(SetChildren(MakeElement("TFrame"), {
	SetProps(MakeElement("List"), {
		HorizontalAlignment = Enum.HorizontalAlignment.Center,
		SortOrder = Enum.SortOrder.LayoutOrder,
		VerticalAlignment = Enum.VerticalAlignment.Bottom,
		Padding = UDim.new(0, 5)
	})
}), {
	Position = UDim2.new(1, -25, 1, -25),
	Size = UDim2.new(0, 300, 1, -25),
	AnchorPoint = Vector2.new(1, 1),
	Parent = Orion
})

function OrionLib:MakeNotification(NotificationConfig)
	spawn(function()
		NotificationConfig.Name = NotificationConfig.Name or "Notification"
		NotificationConfig.Content = NotificationConfig.Content or "Test"
		NotificationConfig.Image = NotificationConfig.Image or "rbxassetid://4384403532"
		NotificationConfig.Time = NotificationConfig.Time or 15

		local NotificationParent = SetProps(MakeElement("TFrame"), {
			Size = UDim2.new(1, 0, 0, 0),
			AutomaticSize = Enum.AutomaticSize.Y,
			Parent = NotificationHolder
		})

		local NotificationFrame = SetChildren(SetProps(MakeElement("RoundFrame", Color3.fromRGB(25, 25, 25), 0, 10), {
			Parent = NotificationParent, 
			Size = UDim2.new(1, 0, 0, 0),
			Position = UDim2.new(1, -55, 0, 0),
			BackgroundTransparency = 0,
			AutomaticSize = Enum.AutomaticSize.Y
		}), {
			MakeElement("Stroke", Color3.fromRGB(93, 93, 93), 1.2),
			MakeElement("Padding", 12, 12, 12, 12),
			SetProps(MakeElement("Image", NotificationConfig.Image), {
				Size = UDim2.new(0, 20, 0, 20),
				ImageColor3 = Color3.fromRGB(240, 240, 240),
				Name = "Icon"
			}),
			SetProps(MakeElement("Label", NotificationConfig.Name, 15), {
				Size = UDim2.new(1, -30, 0, 20),
				Position = UDim2.new(0, 30, 0, 0),
				Font = Enum.Font.GothamBold,
				Name = "Title"
			}),
			SetProps(MakeElement("Label", NotificationConfig.Content, 14), {
				Size = UDim2.new(1, 0, 0, 0),
				Position = UDim2.new(0, 0, 0, 25),
				Font = Enum.Font.GothamSemibold,
				Name = "Content",
				AutomaticSize = Enum.AutomaticSize.Y,
				TextColor3 = Color3.fromRGB(200, 200, 200),
				TextWrapped = true
			})
		})

		TweenService:Create(NotificationFrame, TweenInfo.new(0.5, Enum.EasingStyle.Quint), {Position = UDim2.new(0, 0, 0, 0)}):Play()

		wait(NotificationConfig.Time - 0.88)
		TweenService:Create(NotificationFrame.Icon, TweenInfo.new(0.4, Enum.EasingStyle.Quint), {ImageTransparency = 1}):Play()
		TweenService:Create(NotificationFrame, TweenInfo.new(0.8, Enum.EasingStyle.Quint), {BackgroundTransparency = 0.6}):Play()
		wait(0.3)
		TweenService:Create(NotificationFrame.UIStroke, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {Transparency = 0.9}):Play()
		TweenService:Create(NotificationFrame.Title, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {TextTransparency = 0.4}):Play()
		TweenService:Create(NotificationFrame.Content, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {TextTransparency = 0.5}):Play()
		wait(0.05)

		NotificationFrame:TweenPosition(UDim2.new(1, 20, 0, 0),'In','Quint',0.8,true)
		wait(1.35)
		NotificationFrame:Destroy()
	end)
end    

function OrionLib:Init()
	if OrionLib.SaveCfg then	
		pcall(function()
			if isfile(OrionLib.Folder .. "/" .. game.GameId .. ".txt") then
				LoadCfg(readfile(OrionLib.Folder .. "/" .. game.GameId .. ".txt"))
				OrionLib:MakeNotification({
					Name = "Configuration",
					Content = "Auto-loaded configuration for the game " .. game.GameId .. ".",
					Time = 5
				})
			end
		end)		
	end	
end	

function OrionLib:MakeWindow(WindowConfig)
	local FirstTab = true
	local Minimized = false
	local Loaded = false
	local UIHidden = false

	WindowConfig = WindowConfig or {}
	WindowConfig.Name = WindowConfig.Name or "Orion Library"
	WindowConfig.ConfigFolder = WindowConfig.ConfigFolder or WindowConfig.Name
	WindowConfig.SaveConfig = WindowConfig.SaveConfig or false
	WindowConfig.HidePremium = WindowConfig.HidePremium or false
	if WindowConfig.IntroEnabled == nil then
		WindowConfig.IntroEnabled = true
	end
	WindowConfig.IntroText = WindowConfig.IntroText or "Orion Library"
	WindowConfig.CloseCallback = WindowConfig.CloseCallback or function() end
	WindowConfig.ShowIcon = WindowConfig.ShowIcon or false
	WindowConfig.Icon = WindowConfig.Icon or "rbxassetid://8834748103"
	WindowConfig.IntroIcon = WindowConfig.IntroIcon or "rbxassetid://8834748103"
	OrionLib.Folder = WindowConfig.ConfigFolder
	OrionLib.SaveCfg = WindowConfig.SaveConfig

	if WindowConfig.SaveConfig then
		if not isfolder(WindowConfig.ConfigFolder) then
			makefolder(WindowConfig.ConfigFolder)
		end	
	end

	local TabHolder = AddThemeObject(SetChildren(SetProps(MakeElement("ScrollFrame", Color3.fromRGB(255, 255, 255), 4), {
		Size = UDim2.new(1, 0, 1, -50)
	}), {
		MakeElement("List"),
		MakeElement("Padding", 8, 0, 0, 8)
	}), "Divider")

	AddConnection(TabHolder.UIListLayout:GetPropertyChangedSignal("AbsoluteContentSize"), function()
		TabHolder.CanvasSize = UDim2.new(0, 0, 0, TabHolder.UIListLayout.AbsoluteContentSize.Y + 16)
	end)

	local CloseBtn = SetChildren(SetProps(MakeElement("Button"), {
		Size = UDim2.new(0.5, 0, 1, 0),
		Position = UDim2.new(0.5, 0, 0, 0),
		BackgroundTransparency = 1
	}), {
		AddThemeObject(SetProps(MakeElement("Image", "rbxassetid://7072725342"), {
			Position = UDim2.new(0, 9, 0, 6),
			Size = UDim2.new(0, 18, 0, 18)
		}), "Text")
	})

	local MinimizeBtn = SetChildren(SetProps(MakeElement("Button"), {
		Size = UDim2.new(0.5, 0, 1, 0),
		BackgroundTransparency = 1
	}), {
		AddThemeObject(SetProps(MakeElement("Image", "rbxassetid://7072719338"), {
			Position = UDim2.new(0, 9, 0, 6),
			Size = UDim2.new(0, 18, 0, 18),
			Name = "Ico"
		}), "Text")
	})

	local DragPoint = SetProps(MakeElement("TFrame"), {
		Size = UDim2.new(1, 0, 0, 50)
	})

	local WindowStuff = AddThemeObject(SetChildren(SetProps(MakeElement("RoundFrame", Color3.fromRGB(255, 255, 255), 0, 10), {
		Size = UDim2.new(0, 150, 1, -50),
		Position = UDim2.new(0, 0, 0, 50)
	}), {
		AddThemeObject(SetProps(MakeElement("Frame"), {
			Size = UDim2.new(1, 0, 0, 10),
			Position = UDim2.new(0, 0, 0, 0)
		}), "Second"), 
		AddThemeObject(SetProps(MakeElement("Frame"), {
			Size = UDim2.new(0, 10, 1, 0),
			Position = UDim2.new(1, -10, 0, 0)
		}), "Second"), 
		AddThemeObject(SetProps(MakeElement("Frame"), {
			Size = UDim2.new(0, 1, 1, 0),
			Position = UDim2.new(1, -1, 0, 0)
		}), "Stroke"), 
		TabHolder,
		SetChildren(SetProps(MakeElement("TFrame"), {
			Size = UDim2.new(1, 0, 0, 50),
			Position = UDim2.new(0, 0, 1, -50)
		}), {
			AddThemeObject(SetProps(MakeElement("Frame"), {
				Size = UDim2.new(1, 0, 0, 1)
			}), "Stroke"), 
			AddThemeObject(SetChildren(SetProps(MakeElement("Frame"), {
				AnchorPoint = Vector2.new(0, 0.5),
				Size = UDim2.new(0, 32, 0, 32),
				Position = UDim2.new(0, 10, 0.5, 0)
			}), {
				SetProps(MakeElement("Image", "https://www.roblox.com/headshot-thumbnail/image?userId=".. LocalPlayer.UserId .."&width=420&height=420&format=png"), {
					Size = UDim2.new(1, 0, 1, 0)
				}),
				AddThemeObject(SetProps(MakeElement("Image", "rbxassetid://4031889928"), {
					Size = UDim2.new(1, 0, 1, 0),
				}), "Second"),
				MakeElement("Corner", 1)
			}), "Divider"),
			SetChildren(SetProps(MakeElement("TFrame"), {
				AnchorPoint = Vector2.new(0, 0.5),
				Size = UDim2.new(0, 32, 0, 32),
				Position = UDim2.new(0, 10, 0.5, 0)
			}), {
				AddThemeObject(MakeElement("Stroke"), "Stroke"),
				MakeElement("Corner", 1)
			}),
			AddThemeObject(SetProps(MakeElement("Label", LocalPlayer.DisplayName, WindowConfig.HidePremium and 14 or 13), {
				Size = UDim2.new(1, -60, 0, 13),
				Position = WindowConfig.HidePremium and UDim2.new(0, 50, 0, 19) or UDim2.new(0, 50, 0, 12),
				Font = Enum.Font.GothamBold,
				ClipsDescendants = true
			}), "Text"),
			AddThemeObject(SetProps(MakeElement("Label", "", 12), {
				Size = UDim2.new(1, -60, 0, 12),
				Position = UDim2.new(0, 50, 1, -25),
				Visible = not WindowConfig.HidePremium
			}), "TextDark")
		}),
	}), "Second")

	local WindowName = AddThemeObject(SetProps(MakeElement("Label", WindowConfig.Name, 14), {
		Size = UDim2.new(1, -30, 2, 0),
		Position = UDim2.new(0, 25, 0, -24),
		Font = Enum.Font.GothamBlack,
		TextSize = 20
	}), "Text")

	local WindowTopBarLine = AddThemeObject(SetProps(MakeElement("Frame"), {
		Size = UDim2.new(1, 0, 0, 1),
		Position = UDim2.new(0, 0, 1, -1)
	}), "Stroke")

	local MainWindow = AddThemeObject(SetChildren(SetProps(MakeElement("RoundFrame", Color3.fromRGB(255, 255, 255), 0, 10), {
		Parent = Orion,
		Position = UDim2.new(0.5, -307, 0.5, -172),
		Size = UDim2.new(0, 615, 0, 344),
		ClipsDescendants = true
	}), {
		--SetProps(MakeElement("Image", "rbxassetid://3523728077"), {
		--	AnchorPoint = Vector2.new(0.5, 0.5),
		--	Position = UDim2.new(0.5, 0, 0.5, 0),
		--	Size = UDim2.new(1, 80, 1, 320),
		--	ImageColor3 = Color3.fromRGB(33, 33, 33),
		--	ImageTransparency = 0.7
		--}),
		SetChildren(SetProps(MakeElement("TFrame"), {
			Size = UDim2.new(1, 0, 0, 50),
			Name = "TopBar"
		}), {
			WindowName,
			WindowTopBarLine,
			AddThemeObject(SetChildren(SetProps(MakeElement("RoundFrame", Color3.fromRGB(255, 255, 255), 0, 7), {
				Size = UDim2.new(0, 70, 0, 30),
				Position = UDim2.new(1, -90, 0, 10)
			}), {
				AddThemeObject(MakeElement("Stroke"), "Stroke"),
				AddThemeObject(SetProps(MakeElement("Frame"), {
					Size = UDim2.new(0, 1, 1, 0),
					Position = UDim2.new(0.5, 0, 0, 0)
				}), "Stroke"), 
				CloseBtn,
				MinimizeBtn
			}), "Second"), 
		}),
		DragPoint,
		WindowStuff
	}), "Main")

	if WindowConfig.ShowIcon then
		WindowName.Position = UDim2.new(0, 50, 0, -24)
		local WindowIcon = SetProps(MakeElement("Image", WindowConfig.Icon), {
			Size = UDim2.new(0, 20, 0, 20),
			Position = UDim2.new(0, 25, 0, 15)
		})
		WindowIcon.Parent = MainWindow.TopBar
	end	

	MakeDraggable(DragPoint, MainWindow)

	AddConnection(CloseBtn.MouseButton1Up, function()
		MainWindow.Visible = false
		UIHidden = true
		OrionLib:MakeNotification({
			Name = "Interface Hidden",
			Content = "Tap RightShift to reopen the interface",
			Time = 5
		})
		WindowConfig.CloseCallback()
	end)

	AddConnection(UserInputService.InputBegan, function(Input)
		if Input.KeyCode == Enum.KeyCode.RightShift and UIHidden then
			MainWindow.Visible = true
		end
	end)

	AddConnection(MinimizeBtn.MouseButton1Up, function()
		if Minimized then
			TweenService:Create(MainWindow, TweenInfo.new(0.5, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {Size = UDim2.new(0, 615, 0, 344)}):Play()
			MinimizeBtn.Ico.Image = "rbxassetid://7072719338"
			wait(.02)
			MainWindow.ClipsDescendants = false
			WindowStuff.Visible = true
			WindowTopBarLine.Visible = true
		else
			MainWindow.ClipsDescendants = true
			WindowTopBarLine.Visible = false
			MinimizeBtn.Ico.Image = "rbxassetid://7072720870"

			TweenService:Create(MainWindow, TweenInfo.new(0.5, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {Size = UDim2.new(0, WindowName.TextBounds.X + 140, 0, 50)}):Play()
			wait(0.1)
			WindowStuff.Visible = false	
		end
		Minimized = not Minimized    
	end)

	local function LoadSequence()
		MainWindow.Visible = false
		local LoadSequenceLogo = SetProps(MakeElement("Image", WindowConfig.IntroIcon), {
			Parent = Orion,
			AnchorPoint = Vector2.new(0.5, 0.5),
			Position = UDim2.new(0.5, 0, 0.4, 0),
			Size = UDim2.new(0, 28, 0, 28),
			ImageColor3 = Color3.fromRGB(255, 255, 255),
			ImageTransparency = 1
		})

		local LoadSequenceText = SetProps(MakeElement("Label", WindowConfig.IntroText, 14), {
			Parent = Orion,
			Size = UDim2.new(1, 0, 1, 0),
			AnchorPoint = Vector2.new(0.5, 0.5),
			Position = UDim2.new(0.5, 19, 0.5, 0),
			TextXAlignment = Enum.TextXAlignment.Center,
			Font = Enum.Font.GothamBold,
			TextTransparency = 1
		})

		TweenService:Create(LoadSequenceLogo, TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {ImageTransparency = 0, Position = UDim2.new(0.5, 0, 0.5, 0)}):Play()
		wait(0.8)
		TweenService:Create(LoadSequenceLogo, TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Position = UDim2.new(0.5, -(LoadSequenceText.TextBounds.X/2), 0.5, 0)}):Play()
		wait(0.3)
		TweenService:Create(LoadSequenceText, TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextTransparency = 0}):Play()
		wait(2)
		TweenService:Create(LoadSequenceText, TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextTransparency = 1}):Play()
		MainWindow.Visible = true
		LoadSequenceLogo:Destroy()
		LoadSequenceText:Destroy()
	end 

	if WindowConfig.IntroEnabled then
		LoadSequence()
	end	

	local TabFunction = {}
	function TabFunction:MakeTab(TabConfig)
		TabConfig = TabConfig or {}
		TabConfig.Name = TabConfig.Name or "Tab"
		TabConfig.Icon = TabConfig.Icon or ""
		TabConfig.PremiumOnly = TabConfig.PremiumOnly or false

		local TabFrame = SetChildren(SetProps(MakeElement("Button"), {
			Size = UDim2.new(1, 0, 0, 30),
			Parent = TabHolder
		}), {
			AddThemeObject(SetProps(MakeElement("Image", TabConfig.Icon), {
				AnchorPoint = Vector2.new(0, 0.5),
				Size = UDim2.new(0, 18, 0, 18),
				Position = UDim2.new(0, 10, 0.5, 0),
				ImageTransparency = 0.4,
				Name = "Ico"
			}), "Text"),
			AddThemeObject(SetProps(MakeElement("Label", TabConfig.Name, 14), {
				Size = UDim2.new(1, -35, 1, 0),
				Position = UDim2.new(0, 35, 0, 0),
				Font = Enum.Font.GothamSemibold,
				TextTransparency = 0.4,
				Name = "Title"
			}), "Text")
		})

		if GetIcon(TabConfig.Icon) ~= nil then
			TabFrame.Ico.Image = GetIcon(TabConfig.Icon)
		end	

		local Container = AddThemeObject(SetChildren(SetProps(MakeElement("ScrollFrame", Color3.fromRGB(255, 255, 255), 5), {
			Size = UDim2.new(1, -150, 1, -50),
			Position = UDim2.new(0, 150, 0, 50),
			Parent = MainWindow,
			Visible = false,
			Name = "ItemContainer"
		}), {
			MakeElement("List", 0, 6),
			MakeElement("Padding", 15, 10, 10, 15)
		}), "Divider")

		AddConnection(Container.UIListLayout:GetPropertyChangedSignal("AbsoluteContentSize"), function()
			Container.CanvasSize = UDim2.new(0, 0, 0, Container.UIListLayout.AbsoluteContentSize.Y + 30)
		end)

		if FirstTab then
			FirstTab = false
			TabFrame.Ico.ImageTransparency = 0
			TabFrame.Title.TextTransparency = 0
			TabFrame.Title.Font = Enum.Font.GothamBlack
			Container.Visible = true
		end    

		AddConnection(TabFrame.MouseButton1Click, function()
			for _, Tab in next, TabHolder:GetChildren() do
				if Tab:IsA("TextButton") then
					Tab.Title.Font = Enum.Font.GothamSemibold
					TweenService:Create(Tab.Ico, TweenInfo.new(0.25, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {ImageTransparency = 0.4}):Play()
					TweenService:Create(Tab.Title, TweenInfo.new(0.25, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {TextTransparency = 0.4}):Play()
				end    
			end
			for _, ItemContainer in next, MainWindow:GetChildren() do
				if ItemContainer.Name == "ItemContainer" then
					ItemContainer.Visible = false
				end    
			end  
			TweenService:Create(TabFrame.Ico, TweenInfo.new(0.25, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {ImageTransparency = 0}):Play()
			TweenService:Create(TabFrame.Title, TweenInfo.new(0.25, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {TextTransparency = 0}):Play()
			TabFrame.Title.Font = Enum.Font.GothamBlack
			Container.Visible = true   
		end)

		local function GetElements(ItemParent)
			local ElementFunction = {}
			function ElementFunction:AddLabel(Text)
				local LabelFrame = AddThemeObject(SetChildren(SetProps(MakeElement("RoundFrame", Color3.fromRGB(255, 255, 255), 0, 5), {
					Size = UDim2.new(1, 0, 0, 30),
					BackgroundTransparency = 0.7,
					Parent = ItemParent
				}), {
					AddThemeObject(SetProps(MakeElement("Label", Text, 15), {
						Size = UDim2.new(1, -12, 1, 0),
						Position = UDim2.new(0, 12, 0, 0),
						Font = Enum.Font.GothamBold,
						Name = "Content"
					}), "Text"),
					AddThemeObject(MakeElement("Stroke"), "Stroke")
				}), "Second")

				local LabelFunction = {}
				function LabelFunction:Set(ToChange)
					LabelFrame.Content.Text = ToChange
				end
				return LabelFunction
			end
			function ElementFunction:AddParagraph(Text, Content)
				Text = Text or "Text"
				Content = Content or "Content"

				local ParagraphFrame = AddThemeObject(SetChildren(SetProps(MakeElement("RoundFrame", Color3.fromRGB(255, 255, 255), 0, 5), {
					Size = UDim2.new(1, 0, 0, 30),
					BackgroundTransparency = 0.7,
					Parent = ItemParent
				}), {
					AddThemeObject(SetProps(MakeElement("Label", Text, 15), {
						Size = UDim2.new(1, -12, 0, 14),
						Position = UDim2.new(0, 12, 0, 10),
						Font = Enum.Font.GothamBold,
						Name = "Title"
					}), "Text"),
					AddThemeObject(SetProps(MakeElement("Label", "", 13), {
						Size = UDim2.new(1, -24, 0, 0),
						Position = UDim2.new(0, 12, 0, 26),
						Font = Enum.Font.GothamSemibold,
						Name = "Content",
						TextWrapped = true
					}), "TextDark"),
					AddThemeObject(MakeElement("Stroke"), "Stroke")
				}), "Second")

				AddConnection(ParagraphFrame.Content:GetPropertyChangedSignal("Text"), function()
					ParagraphFrame.Content.Size = UDim2.new(1, -24, 0, ParagraphFrame.Content.TextBounds.Y)
					ParagraphFrame.Size = UDim2.new(1, 0, 0, ParagraphFrame.Content.TextBounds.Y + 35)
				end)

				ParagraphFrame.Content.Text = Content

				local ParagraphFunction = {}
				function ParagraphFunction:Set(ToChange)
					ParagraphFrame.Content.Text = ToChange
				end
				return ParagraphFunction
			end    
			function ElementFunction:AddButton(ButtonConfig)
				ButtonConfig = ButtonConfig or {}
				ButtonConfig.Name = ButtonConfig.Name or "Button"
				ButtonConfig.Callback = ButtonConfig.Callback or function() end
				ButtonConfig.Icon = ButtonConfig.Icon or "rbxassetid://3944703587"

				local Button = {}

				local Click = SetProps(MakeElement("Button"), {
					Size = UDim2.new(1, 0, 1, 0)
				})

				local ButtonFrame = AddThemeObject(SetChildren(SetProps(MakeElement("RoundFrame", Color3.fromRGB(255, 255, 255), 0, 5), {
					Size = UDim2.new(1, 0, 0, 33),
					Parent = ItemParent
				}), {
					AddThemeObject(SetProps(MakeElement("Label", ButtonConfig.Name, 15), {
						Size = UDim2.new(1, -12, 1, 0),
						Position = UDim2.new(0, 12, 0, 0),
						Font = Enum.Font.GothamBold,
						Name = "Content"
					}), "Text"),
					AddThemeObject(SetProps(MakeElement("Image", ButtonConfig.Icon), {
						Size = UDim2.new(0, 20, 0, 20),
						Position = UDim2.new(1, -30, 0, 7),
					}), "TextDark"),
					AddThemeObject(MakeElement("Stroke"), "Stroke"),
					Click
				}), "Second")

				AddConnection(Click.MouseEnter, function()
					TweenService:Create(ButtonFrame, TweenInfo.new(0.25, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {BackgroundColor3 = Color3.fromRGB(OrionLib.Themes[OrionLib.SelectedTheme].Second.R * 255 + 3, OrionLib.Themes[OrionLib.SelectedTheme].Second.G * 255 + 3, OrionLib.Themes[OrionLib.SelectedTheme].Second.B * 255 + 3)}):Play()
				end)

				AddConnection(Click.MouseLeave, function()
					TweenService:Create(ButtonFrame, TweenInfo.new(0.25, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {BackgroundColor3 = OrionLib.Themes[OrionLib.SelectedTheme].Second}):Play()
				end)

				AddConnection(Click.MouseButton1Up, function()
					TweenService:Create(ButtonFrame, TweenInfo.new(0.25, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {BackgroundColor3 = Color3.fromRGB(OrionLib.Themes[OrionLib.SelectedTheme].Second.R * 255 + 3, OrionLib.Themes[OrionLib.SelectedTheme].Second.G * 255 + 3, OrionLib.Themes[OrionLib.SelectedTheme].Second.B * 255 + 3)}):Play()
					spawn(function()
						ButtonConfig.Callback()
					end)
				end)

				AddConnection(Click.MouseButton1Down, function()
					TweenService:Create(ButtonFrame, TweenInfo.new(0.25, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {BackgroundColor3 = Color3.fromRGB(OrionLib.Themes[OrionLib.SelectedTheme].Second.R * 255 + 6, OrionLib.Themes[OrionLib.SelectedTheme].Second.G * 255 + 6, OrionLib.Themes[OrionLib.SelectedTheme].Second.B * 255 + 6)}):Play()
				end)

				function Button:Set(ButtonText)
					ButtonFrame.Content.Text = ButtonText
				end	

				return Button
			end    
			function ElementFunction:AddToggle(ToggleConfig)
				ToggleConfig = ToggleConfig or {}
				ToggleConfig.Name = ToggleConfig.Name or "Toggle"
				ToggleConfig.Default = ToggleConfig.Default or false
				ToggleConfig.Callback = ToggleConfig.Callback or function() end
				ToggleConfig.Color = ToggleConfig.Color or Color3.fromRGB(9, 99, 195)
				ToggleConfig.Flag = ToggleConfig.Flag or nil
				ToggleConfig.Save = ToggleConfig.Save or false

				local Toggle = {Value = ToggleConfig.Default, Save = ToggleConfig.Save}

				local Click = SetProps(MakeElement("Button"), {
					Size = UDim2.new(1, 0, 1, 0)
				})

				local ToggleBox = SetChildren(SetProps(MakeElement("RoundFrame", ToggleConfig.Color, 0, 4), {
					Size = UDim2.new(0, 24, 0, 24),
					Position = UDim2.new(1, -24, 0.5, 0),
					AnchorPoint = Vector2.new(0.5, 0.5)
				}), {
					SetProps(MakeElement("Stroke"), {
						Color = ToggleConfig.Color,
						Name = "Stroke",
						Transparency = 0.5
					}),
					SetProps(MakeElement("Image", "rbxassetid://3944680095"), {
						Size = UDim2.new(0, 20, 0, 20),
						AnchorPoint = Vector2.new(0.5, 0.5),
						Position = UDim2.new(0.5, 0, 0.5, 0),
						ImageColor3 = Color3.fromRGB(255, 255, 255),
						Name = "Ico"
					}),
				})

				local ToggleFrame = AddThemeObject(SetChildren(SetProps(MakeElement("RoundFrame", Color3.fromRGB(255, 255, 255), 0, 5), {
					Size = UDim2.new(1, 0, 0, 38),
					Parent = ItemParent
				}), {
					AddThemeObject(SetProps(MakeElement("Label", ToggleConfig.Name, 15), {
						Size = UDim2.new(1, -12, 1, 0),
						Position = UDim2.new(0, 12, 0, 0),
						Font = Enum.Font.GothamBold,
						Name = "Content"
					}), "Text"),
					AddThemeObject(MakeElement("Stroke"), "Stroke"),
					ToggleBox,
					Click
				}), "Second")

				function Toggle:Set(Value)
					Toggle.Value = Value
					TweenService:Create(ToggleBox, TweenInfo.new(0.3, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {BackgroundColor3 = Toggle.Value and ToggleConfig.Color or OrionLib.Themes.Default.Divider}):Play()
					TweenService:Create(ToggleBox.Stroke, TweenInfo.new(0.3, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {Color = Toggle.Value and ToggleConfig.Color or OrionLib.Themes.Default.Stroke}):Play()
					TweenService:Create(ToggleBox.Ico, TweenInfo.new(0.3, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {ImageTransparency = Toggle.Value and 0 or 1, Size = Toggle.Value and UDim2.new(0, 20, 0, 20) or UDim2.new(0, 8, 0, 8)}):Play()
					ToggleConfig.Callback(Toggle.Value)
				end    

				Toggle:Set(Toggle.Value)

				AddConnection(Click.MouseEnter, function()
					TweenService:Create(ToggleFrame, TweenInfo.new(0.25, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {BackgroundColor3 = Color3.fromRGB(OrionLib.Themes[OrionLib.SelectedTheme].Second.R * 255 + 3, OrionLib.Themes[OrionLib.SelectedTheme].Second.G * 255 + 3, OrionLib.Themes[OrionLib.SelectedTheme].Second.B * 255 + 3)}):Play()
				end)

				AddConnection(Click.MouseLeave, function()
					TweenService:Create(ToggleFrame, TweenInfo.new(0.25, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {BackgroundColor3 = OrionLib.Themes[OrionLib.SelectedTheme].Second}):Play()
				end)

				AddConnection(Click.MouseButton1Up, function()
					TweenService:Create(ToggleFrame, TweenInfo.new(0.25, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {BackgroundColor3 = Color3.fromRGB(OrionLib.Themes[OrionLib.SelectedTheme].Second.R * 255 + 3, OrionLib.Themes[OrionLib.SelectedTheme].Second.G * 255 + 3, OrionLib.Themes[OrionLib.SelectedTheme].Second.B * 255 + 3)}):Play()
					SaveCfg(game.GameId)
					Toggle:Set(not Toggle.Value)
				end)

				AddConnection(Click.MouseButton1Down, function()
					TweenService:Create(ToggleFrame, TweenInfo.new(0.25, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {BackgroundColor3 = Color3.fromRGB(OrionLib.Themes[OrionLib.SelectedTheme].Second.R * 255 + 6, OrionLib.Themes[OrionLib.SelectedTheme].Second.G * 255 + 6, OrionLib.Themes[OrionLib.SelectedTheme].Second.B * 255 + 6)}):Play()
				end)

				if ToggleConfig.Flag then
					OrionLib.Flags[ToggleConfig.Flag] = Toggle
				end	
				return Toggle
			end  
			function ElementFunction:AddSlider(SliderConfig)
				SliderConfig = SliderConfig or {}
				SliderConfig.Name = SliderConfig.Name or "Slider"
				SliderConfig.Min = SliderConfig.Min or 0
				SliderConfig.Max = SliderConfig.Max or 100
				SliderConfig.Increment = SliderConfig.Increment or 1
				SliderConfig.Default = SliderConfig.Default or 50
				SliderConfig.Callback = SliderConfig.Callback or function() end
				SliderConfig.ValueName = SliderConfig.ValueName or ""
				SliderConfig.Color = SliderConfig.Color or Color3.fromRGB(9, 149, 98)
				SliderConfig.Flag = SliderConfig.Flag or nil
				SliderConfig.Save = SliderConfig.Save or false

				local Slider = {Value = SliderConfig.Default, Save = SliderConfig.Save}
				local Dragging = false

				local SliderDrag = SetChildren(SetProps(MakeElement("RoundFrame", SliderConfig.Color, 0, 5), {
					Size = UDim2.new(0, 0, 1, 0),
					BackgroundTransparency = 0.3,
					ClipsDescendants = true
				}), {
					AddThemeObject(SetProps(MakeElement("Label", "value", 13), {
						Size = UDim2.new(1, -12, 0, 14),
						Position = UDim2.new(0, 12, 0, 6),
						Font = Enum.Font.GothamBold,
						Name = "Value",
						TextTransparency = 0
					}), "Text")
				})

				local SliderBar = SetChildren(SetProps(MakeElement("RoundFrame", SliderConfig.Color, 0, 5), {
					Size = UDim2.new(1, -24, 0, 26),
					Position = UDim2.new(0, 12, 0, 30),
					BackgroundTransparency = 0.9
				}), {
					SetProps(MakeElement("Stroke"), {
						Color = SliderConfig.Color
					}),
					AddThemeObject(SetProps(MakeElement("Label", "value", 13), {
						Size = UDim2.new(1, -12, 0, 14),
						Position = UDim2.new(0, 12, 0, 6),
						Font = Enum.Font.GothamBold,
						Name = "Value",
						TextTransparency = 0.8
					}), "Text"),
					SliderDrag
				})

				local SliderFrame = AddThemeObject(SetChildren(SetProps(MakeElement("RoundFrame", Color3.fromRGB(255, 255, 255), 0, 4), {
					Size = UDim2.new(1, 0, 0, 65),
					Parent = ItemParent
				}), {
					AddThemeObject(SetProps(MakeElement("Label", SliderConfig.Name, 15), {
						Size = UDim2.new(1, -12, 0, 14),
						Position = UDim2.new(0, 12, 0, 10),
						Font = Enum.Font.GothamBold,
						Name = "Content"
					}), "Text"),
					AddThemeObject(MakeElement("Stroke"), "Stroke"),
					SliderBar
				}), "Second")

				SliderBar.InputBegan:Connect(function(Input)
					if Input.UserInputType == Enum.UserInputType.MouseButton1 then 
						Dragging = true 
					end 
				end)
				SliderBar.InputEnded:Connect(function(Input) 
					if Input.UserInputType == Enum.UserInputType.MouseButton1 then 
						Dragging = false 
					end 
				end)

				UserInputService.InputChanged:Connect(function(Input)
					if Dragging and Input.UserInputType == Enum.UserInputType.MouseMovement then 
						local SizeScale = math.clamp((Input.Position.X - SliderBar.AbsolutePosition.X) / SliderBar.AbsoluteSize.X, 0, 1)
						Slider:Set(SliderConfig.Min + ((SliderConfig.Max - SliderConfig.Min) * SizeScale)) 
						SaveCfg(game.GameId)
					end
				end)

				function Slider:Set(Value)
					self.Value = math.clamp(Round(Value, SliderConfig.Increment), SliderConfig.Min, SliderConfig.Max)
					TweenService:Create(SliderDrag,TweenInfo.new(.15, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),{Size = UDim2.fromScale((self.Value - SliderConfig.Min) / (SliderConfig.Max - SliderConfig.Min), 1)}):Play()
					SliderBar.Value.Text = tostring(self.Value) .. " " .. SliderConfig.ValueName
					SliderDrag.Value.Text = tostring(self.Value) .. " " .. SliderConfig.ValueName
					SliderConfig.Callback(self.Value)
				end      

				Slider:Set(Slider.Value)
				if SliderConfig.Flag then				
					OrionLib.Flags[SliderConfig.Flag] = Slider
				end
				return Slider
			end  
			function ElementFunction:AddDropdown(DropdownConfig)
				DropdownConfig = DropdownConfig or {}
				DropdownConfig.Name = DropdownConfig.Name or "Dropdown"
				DropdownConfig.Options = DropdownConfig.Options or {}
				DropdownConfig.Default = DropdownConfig.Default or ""
				DropdownConfig.Callback = DropdownConfig.Callback or function() end
				DropdownConfig.Flag = DropdownConfig.Flag or nil
				DropdownConfig.Save = DropdownConfig.Save or false

				local Dropdown = {Value = DropdownConfig.Default, Options = DropdownConfig.Options, Buttons = {}, Toggled = false, Type = "Dropdown", Save = DropdownConfig.Save}
				local MaxElements = 5

				if not table.find(Dropdown.Options, Dropdown.Value) then
					Dropdown.Value = "..."
				end

				local DropdownList = MakeElement("List")

				local DropdownContainer = AddThemeObject(SetProps(SetChildren(MakeElement("ScrollFrame", Color3.fromRGB(40, 40, 40), 4), {
					DropdownList
				}), {
					Parent = ItemParent,
					Position = UDim2.new(0, 0, 0, 38),
					Size = UDim2.new(1, 0, 1, -38),
					ClipsDescendants = true
				}), "Divider")

				local Click = SetProps(MakeElement("Button"), {
					Size = UDim2.new(1, 0, 1, 0)
				})

				local DropdownFrame = AddThemeObject(SetChildren(SetProps(MakeElement("RoundFrame", Color3.fromRGB(255, 255, 255), 0, 5), {
					Size = UDim2.new(1, 0, 0, 38),
					Parent = ItemParent,
					ClipsDescendants = true
				}), {
					DropdownContainer,
					SetProps(SetChildren(MakeElement("TFrame"), {
						AddThemeObject(SetProps(MakeElement("Label", DropdownConfig.Name, 15), {
							Size = UDim2.new(1, -12, 1, 0),
							Position = UDim2.new(0, 12, 0, 0),
							Font = Enum.Font.GothamBold,
							Name = "Content"
						}), "Text"),
						AddThemeObject(SetProps(MakeElement("Image", "rbxassetid://7072706796"), {
							Size = UDim2.new(0, 20, 0, 20),
							AnchorPoint = Vector2.new(0, 0.5),
							Position = UDim2.new(1, -30, 0.5, 0),
							ImageColor3 = Color3.fromRGB(240, 240, 240),
							Name = "Ico"
						}), "TextDark"),
						AddThemeObject(SetProps(MakeElement("Label", "Selected", 13), {
							Size = UDim2.new(1, -40, 1, 0),
							Font = Enum.Font.Gotham,
							Name = "Selected",
							TextXAlignment = Enum.TextXAlignment.Right
						}), "TextDark"),
						AddThemeObject(SetProps(MakeElement("Frame"), {
							Size = UDim2.new(1, 0, 0, 1),
							Position = UDim2.new(0, 0, 1, -1),
							Name = "Line",
							Visible = false
						}), "Stroke"), 
						Click
					}), {
						Size = UDim2.new(1, 0, 0, 38),
						ClipsDescendants = true,
						Name = "F"
					}),
					AddThemeObject(MakeElement("Stroke"), "Stroke"),
					MakeElement("Corner")
				}), "Second")

				AddConnection(DropdownList:GetPropertyChangedSignal("AbsoluteContentSize"), function()
					DropdownContainer.CanvasSize = UDim2.new(0, 0, 0, DropdownList.AbsoluteContentSize.Y)
				end)  

				local function AddOptions(Options)
					for _, Option in pairs(Options) do
						local OptionBtn = AddThemeObject(SetProps(SetChildren(MakeElement("Button", Color3.fromRGB(40, 40, 40)), {
							MakeElement("Corner", 0, 6),
							AddThemeObject(SetProps(MakeElement("Label", Option, 13, 0.4), {
								Position = UDim2.new(0, 8, 0, 0),
								Size = UDim2.new(1, -8, 1, 0),
								Name = "Title"
							}), "Text")
						}), {
							Parent = DropdownContainer,
							Size = UDim2.new(1, 0, 0, 28),
							BackgroundTransparency = 1,
							ClipsDescendants = true
						}), "Divider")

						AddConnection(OptionBtn.MouseButton1Click, function()
							Dropdown:Set(Option)
							SaveCfg(game.GameId)
						end)

						Dropdown.Buttons[Option] = OptionBtn
					end
				end	

				function Dropdown:Refresh(Options, Delete)
					if Delete then
						for _,v in pairs(Dropdown.Buttons) do
							v:Destroy()
						end    
						table.clear(Dropdown.Options)
						table.clear(Dropdown.Buttons)
					end
					Dropdown.Options = Options
					AddOptions(Dropdown.Options)
				end  

				function Dropdown:Set(Value)
					if not table.find(Dropdown.Options, Value) then
						Dropdown.Value = "..."
						DropdownFrame.F.Selected.Text = Dropdown.Value
						for _, v in pairs(Dropdown.Buttons) do
							TweenService:Create(v,TweenInfo.new(.15, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),{BackgroundTransparency = 1}):Play()
							TweenService:Create(v.Title,TweenInfo.new(.15, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),{TextTransparency = 0.4}):Play()
						end	
						return
					end

					Dropdown.Value = Value
					DropdownFrame.F.Selected.Text = Dropdown.Value

					for _, v in pairs(Dropdown.Buttons) do
						TweenService:Create(v,TweenInfo.new(.15, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),{BackgroundTransparency = 1}):Play()
						TweenService:Create(v.Title,TweenInfo.new(.15, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),{TextTransparency = 0.4}):Play()
					end	
					TweenService:Create(Dropdown.Buttons[Value],TweenInfo.new(.15, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),{BackgroundTransparency = 0}):Play()
					TweenService:Create(Dropdown.Buttons[Value].Title,TweenInfo.new(.15, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),{TextTransparency = 0}):Play()
					return DropdownConfig.Callback(Dropdown.Value)
				end

				AddConnection(Click.MouseButton1Click, function()
					Dropdown.Toggled = not Dropdown.Toggled
					DropdownFrame.F.Line.Visible = Dropdown.Toggled
					TweenService:Create(DropdownFrame.F.Ico,TweenInfo.new(.15, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),{Rotation = Dropdown.Toggled and 180 or 0}):Play()
					if #Dropdown.Options > MaxElements then
						TweenService:Create(DropdownFrame,TweenInfo.new(.15, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),{Size = Dropdown.Toggled and UDim2.new(1, 0, 0, 38 + (MaxElements * 28)) or UDim2.new(1, 0, 0, 38)}):Play()
					else
						TweenService:Create(DropdownFrame,TweenInfo.new(.15, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),{Size = Dropdown.Toggled and UDim2.new(1, 0, 0, DropdownList.AbsoluteContentSize.Y + 38) or UDim2.new(1, 0, 0, 38)}):Play()
					end
				end)

				Dropdown:Refresh(Dropdown.Options, false)
				Dropdown:Set(Dropdown.Value)
				if DropdownConfig.Flag then				
					OrionLib.Flags[DropdownConfig.Flag] = Dropdown
				end
				return Dropdown
			end
			function ElementFunction:AddBind(BindConfig)
				BindConfig.Name = BindConfig.Name or "Bind"
				BindConfig.Default = BindConfig.Default or Enum.KeyCode.Unknown
				BindConfig.Hold = BindConfig.Hold or false
				BindConfig.Callback = BindConfig.Callback or function() end
				BindConfig.Flag = BindConfig.Flag or nil
				BindConfig.Save = BindConfig.Save or false

				local Bind = {Value, Binding = false, Type = "Bind", Save = BindConfig.Save}
				local Holding = false

				local Click = SetProps(MakeElement("Button"), {
					Size = UDim2.new(1, 0, 1, 0)
				})

				local BindBox = AddThemeObject(SetChildren(SetProps(MakeElement("RoundFrame", Color3.fromRGB(255, 255, 255), 0, 4), {
					Size = UDim2.new(0, 24, 0, 24),
					Position = UDim2.new(1, -12, 0.5, 0),
					AnchorPoint = Vector2.new(1, 0.5)
				}), {
					AddThemeObject(MakeElement("Stroke"), "Stroke"),
					AddThemeObject(SetProps(MakeElement("Label", BindConfig.Name, 14), {
						Size = UDim2.new(1, 0, 1, 0),
						Font = Enum.Font.GothamBold,
						TextXAlignment = Enum.TextXAlignment.Center,
						Name = "Value"
					}), "Text")
				}), "Main")

				local BindFrame = AddThemeObject(SetChildren(SetProps(MakeElement("RoundFrame", Color3.fromRGB(255, 255, 255), 0, 5), {
					Size = UDim2.new(1, 0, 0, 38),
					Parent = ItemParent
				}), {
					AddThemeObject(SetProps(MakeElement("Label", BindConfig.Name, 15), {
						Size = UDim2.new(1, -12, 1, 0),
						Position = UDim2.new(0, 12, 0, 0),
						Font = Enum.Font.GothamBold,
						Name = "Content"
					}), "Text"),
					AddThemeObject(MakeElement("Stroke"), "Stroke"),
					BindBox,
					Click
				}), "Second")

				AddConnection(BindBox.Value:GetPropertyChangedSignal("Text"), function()
					--BindBox.Size = UDim2.new(0, BindBox.Value.TextBounds.X + 16, 0, 24)
					TweenService:Create(BindBox, TweenInfo.new(0.25, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {Size = UDim2.new(0, BindBox.Value.TextBounds.X + 16, 0, 24)}):Play()
				end)

				AddConnection(Click.InputEnded, function(Input)
					if Input.UserInputType == Enum.UserInputType.MouseButton1 then
						if Bind.Binding then return end
						Bind.Binding = true
						BindBox.Value.Text = ""
					end
				end)

				AddConnection(UserInputService.InputBegan, function(Input)
					if UserInputService:GetFocusedTextBox() then return end
					if (Input.KeyCode.Name == Bind.Value or Input.UserInputType.Name == Bind.Value) and not Bind.Binding then
						if BindConfig.Hold then
							Holding = true
							BindConfig.Callback(Holding)
						else
							BindConfig.Callback()
						end
					elseif Bind.Binding then
						local Key
						pcall(function()
							if not CheckKey(BlacklistedKeys, Input.KeyCode) then
								Key = Input.KeyCode
							end
						end)
						pcall(function()
							if CheckKey(WhitelistedMouse, Input.UserInputType) and not Key then
								Key = Input.UserInputType
							end
						end)
						Key = Key or Bind.Value
						Bind:Set(Key)
						SaveCfg(game.GameId)
					end
				end)

				AddConnection(UserInputService.InputEnded, function(Input)
					if Input.KeyCode.Name == Bind.Value or Input.UserInputType.Name == Bind.Value then
						if BindConfig.Hold and Holding then
							Holding = false
							BindConfig.Callback(Holding)
						end
					end
				end)

				AddConnection(Click.MouseEnter, function()
					TweenService:Create(BindFrame, TweenInfo.new(0.25, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {BackgroundColor3 = Color3.fromRGB(OrionLib.Themes[OrionLib.SelectedTheme].Second.R * 255 + 3, OrionLib.Themes[OrionLib.SelectedTheme].Second.G * 255 + 3, OrionLib.Themes[OrionLib.SelectedTheme].Second.B * 255 + 3)}):Play()
				end)

				AddConnection(Click.MouseLeave, function()
					TweenService:Create(BindFrame, TweenInfo.new(0.25, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {BackgroundColor3 = OrionLib.Themes[OrionLib.SelectedTheme].Second}):Play()
				end)

				AddConnection(Click.MouseButton1Up, function()
					TweenService:Create(BindFrame, TweenInfo.new(0.25, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {BackgroundColor3 = Color3.fromRGB(OrionLib.Themes[OrionLib.SelectedTheme].Second.R * 255 + 3, OrionLib.Themes[OrionLib.SelectedTheme].Second.G * 255 + 3, OrionLib.Themes[OrionLib.SelectedTheme].Second.B * 255 + 3)}):Play()
				end)

				AddConnection(Click.MouseButton1Down, function()
					TweenService:Create(BindFrame, TweenInfo.new(0.25, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {BackgroundColor3 = Color3.fromRGB(OrionLib.Themes[OrionLib.SelectedTheme].Second.R * 255 + 6, OrionLib.Themes[OrionLib.SelectedTheme].Second.G * 255 + 6, OrionLib.Themes[OrionLib.SelectedTheme].Second.B * 255 + 6)}):Play()
				end)

				function Bind:Set(Key)
					Bind.Binding = false
					Bind.Value = Key or Bind.Value
					Bind.Value = Bind.Value.Name or Bind.Value
					BindBox.Value.Text = Bind.Value
				end

				Bind:Set(BindConfig.Default)
				if BindConfig.Flag then				
					OrionLib.Flags[BindConfig.Flag] = Bind
				end
				return Bind
			end  
			function ElementFunction:AddTextbox(TextboxConfig)
				TextboxConfig = TextboxConfig or {}
				TextboxConfig.Name = TextboxConfig.Name or "Textbox"
				TextboxConfig.Default = TextboxConfig.Default or ""
				TextboxConfig.TextDisappear = TextboxConfig.TextDisappear or false
				TextboxConfig.Callback = TextboxConfig.Callback or function() end

				local Click = SetProps(MakeElement("Button"), {
					Size = UDim2.new(1, 0, 1, 0)
				})

				local TextboxActual = AddThemeObject(Create("TextBox", {
					Size = UDim2.new(1, 0, 1, 0),
					BackgroundTransparency = 1,
					TextColor3 = Color3.fromRGB(255, 255, 255),
					PlaceholderColor3 = Color3.fromRGB(210,210,210),
					PlaceholderText = "Input",
					Font = Enum.Font.GothamSemibold,
					TextXAlignment = Enum.TextXAlignment.Center,
					TextSize = 14,
					ClearTextOnFocus = false
				}), "Text")

				local TextContainer = AddThemeObject(SetChildren(SetProps(MakeElement("RoundFrame", Color3.fromRGB(255, 255, 255), 0, 4), {
					Size = UDim2.new(0, 24, 0, 24),
					Position = UDim2.new(1, -12, 0.5, 0),
					AnchorPoint = Vector2.new(1, 0.5)
				}), {
					AddThemeObject(MakeElement("Stroke"), "Stroke"),
					TextboxActual
				}), "Main")


				local TextboxFrame = AddThemeObject(SetChildren(SetProps(MakeElement("RoundFrame", Color3.fromRGB(255, 255, 255), 0, 5), {
					Size = UDim2.new(1, 0, 0, 38),
					Parent = ItemParent
				}), {
					AddThemeObject(SetProps(MakeElement("Label", TextboxConfig.Name, 15), {
						Size = UDim2.new(1, -12, 1, 0),
						Position = UDim2.new(0, 12, 0, 0),
						Font = Enum.Font.GothamBold,
						Name = "Content"
					}), "Text"),
					AddThemeObject(MakeElement("Stroke"), "Stroke"),
					TextContainer,
					Click
				}), "Second")

				AddConnection(TextboxActual:GetPropertyChangedSignal("Text"), function()
					--TextContainer.Size = UDim2.new(0, TextboxActual.TextBounds.X + 16, 0, 24)
					TweenService:Create(TextContainer, TweenInfo.new(0.45, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {Size = UDim2.new(0, TextboxActual.TextBounds.X + 16, 0, 24)}):Play()
				end)

				AddConnection(TextboxActual.FocusLost, function()
					TextboxConfig.Callback(TextboxActual.Text)
					if TextboxConfig.TextDisappear then
						TextboxActual.Text = ""
					end	
				end)

				TextboxActual.Text = TextboxConfig.Default

				AddConnection(Click.MouseEnter, function()
					TweenService:Create(TextboxFrame, TweenInfo.new(0.25, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {BackgroundColor3 = Color3.fromRGB(OrionLib.Themes[OrionLib.SelectedTheme].Second.R * 255 + 3, OrionLib.Themes[OrionLib.SelectedTheme].Second.G * 255 + 3, OrionLib.Themes[OrionLib.SelectedTheme].Second.B * 255 + 3)}):Play()
				end)

				AddConnection(Click.MouseLeave, function()
					TweenService:Create(TextboxFrame, TweenInfo.new(0.25, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {BackgroundColor3 = OrionLib.Themes[OrionLib.SelectedTheme].Second}):Play()
				end)

				AddConnection(Click.MouseButton1Up, function()
					TweenService:Create(TextboxFrame, TweenInfo.new(0.25, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {BackgroundColor3 = Color3.fromRGB(OrionLib.Themes[OrionLib.SelectedTheme].Second.R * 255 + 3, OrionLib.Themes[OrionLib.SelectedTheme].Second.G * 255 + 3, OrionLib.Themes[OrionLib.SelectedTheme].Second.B * 255 + 3)}):Play()
					TextboxActual:CaptureFocus()
				end)

				AddConnection(Click.MouseButton1Down, function()
					TweenService:Create(TextboxFrame, TweenInfo.new(0.25, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {BackgroundColor3 = Color3.fromRGB(OrionLib.Themes[OrionLib.SelectedTheme].Second.R * 255 + 6, OrionLib.Themes[OrionLib.SelectedTheme].Second.G * 255 + 6, OrionLib.Themes[OrionLib.SelectedTheme].Second.B * 255 + 6)}):Play()
				end)
			end 
			function ElementFunction:AddColorpicker(ColorpickerConfig)
				ColorpickerConfig = ColorpickerConfig or {}
				ColorpickerConfig.Name = ColorpickerConfig.Name or "Colorpicker"
				ColorpickerConfig.Default = ColorpickerConfig.Default or Color3.fromRGB(255,255,255)
				ColorpickerConfig.Callback = ColorpickerConfig.Callback or function() end
				ColorpickerConfig.Flag = ColorpickerConfig.Flag or nil
				ColorpickerConfig.Save = ColorpickerConfig.Save or false

				local ColorH, ColorS, ColorV = 1, 1, 1
				local Colorpicker = {Value = ColorpickerConfig.Default, Toggled = false, Type = "Colorpicker", Save = ColorpickerConfig.Save}

				local ColorSelection = Create("ImageLabel", {
					Size = UDim2.new(0, 18, 0, 18),
					Position = UDim2.new(select(3, Color3.toHSV(Colorpicker.Value))),
					ScaleType = Enum.ScaleType.Fit,
					AnchorPoint = Vector2.new(0.5, 0.5),
					BackgroundTransparency = 1,
					Image = "http://www.roblox.com/asset/?id=4805639000"
				})

				local HueSelection = Create("ImageLabel", {
					Size = UDim2.new(0, 18, 0, 18),
					Position = UDim2.new(0.5, 0, 1 - select(1, Color3.toHSV(Colorpicker.Value))),
					ScaleType = Enum.ScaleType.Fit,
					AnchorPoint = Vector2.new(0.5, 0.5),
					BackgroundTransparency = 1,
					Image = "http://www.roblox.com/asset/?id=4805639000"
				})

				local Color = Create("ImageLabel", {
					Size = UDim2.new(1, -25, 1, 0),
					Visible = false,
					Image = "rbxassetid://4155801252"
				}, {
					Create("UICorner", {CornerRadius = UDim.new(0, 5)}),
					ColorSelection
				})

				local Hue = Create("Frame", {
					Size = UDim2.new(0, 20, 1, 0),
					Position = UDim2.new(1, -20, 0, 0),
					Visible = false
				}, {
					Create("UIGradient", {Rotation = 270, Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(255, 0, 4)), ColorSequenceKeypoint.new(0.20, Color3.fromRGB(234, 255, 0)), ColorSequenceKeypoint.new(0.40, Color3.fromRGB(21, 255, 0)), ColorSequenceKeypoint.new(0.60, Color3.fromRGB(0, 255, 255)), ColorSequenceKeypoint.new(0.80, Color3.fromRGB(0, 17, 255)), ColorSequenceKeypoint.new(0.90, Color3.fromRGB(255, 0, 251)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(255, 0, 4))},}),
					Create("UICorner", {CornerRadius = UDim.new(0, 5)}),
					HueSelection
				})

				local ColorpickerContainer = Create("Frame", {
					Position = UDim2.new(0, 0, 0, 32),
					Size = UDim2.new(1, 0, 1, -32),
					BackgroundTransparency = 1,
					ClipsDescendants = true
				}, {
					Hue,
					Color,
					Create("UIPadding", {
						PaddingLeft = UDim.new(0, 35),
						PaddingRight = UDim.new(0, 35),
						PaddingBottom = UDim.new(0, 10),
						PaddingTop = UDim.new(0, 17)
					})
				})

				local Click = SetProps(MakeElement("Button"), {
					Size = UDim2.new(1, 0, 1, 0)
				})

				local ColorpickerBox = AddThemeObject(SetChildren(SetProps(MakeElement("RoundFrame", Color3.fromRGB(255, 255, 255), 0, 4), {
					Size = UDim2.new(0, 24, 0, 24),
					Position = UDim2.new(1, -12, 0.5, 0),
					AnchorPoint = Vector2.new(1, 0.5)
				}), {
					AddThemeObject(MakeElement("Stroke"), "Stroke")
				}), "Main")

				local ColorpickerFrame = AddThemeObject(SetChildren(SetProps(MakeElement("RoundFrame", Color3.fromRGB(255, 255, 255), 0, 5), {
					Size = UDim2.new(1, 0, 0, 38),
					Parent = ItemParent
				}), {
					SetProps(SetChildren(MakeElement("TFrame"), {
						AddThemeObject(SetProps(MakeElement("Label", ColorpickerConfig.Name, 15), {
							Size = UDim2.new(1, -12, 1, 0),
							Position = UDim2.new(0, 12, 0, 0),
							Font = Enum.Font.GothamBold,
							Name = "Content"
						}), "Text"),
						ColorpickerBox,
						Click,
						AddThemeObject(SetProps(MakeElement("Frame"), {
							Size = UDim2.new(1, 0, 0, 1),
							Position = UDim2.new(0, 0, 1, -1),
							Name = "Line",
							Visible = false
						}), "Stroke"), 
					}), {
						Size = UDim2.new(1, 0, 0, 38),
						ClipsDescendants = true,
						Name = "F"
					}),
					ColorpickerContainer,
					AddThemeObject(MakeElement("Stroke"), "Stroke"),
				}), "Second")

				AddConnection(Click.MouseButton1Click, function()
					Colorpicker.Toggled = not Colorpicker.Toggled
					TweenService:Create(ColorpickerFrame,TweenInfo.new(.15, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),{Size = Colorpicker.Toggled and UDim2.new(1, 0, 0, 148) or UDim2.new(1, 0, 0, 38)}):Play()
					Color.Visible = Colorpicker.Toggled
					Hue.Visible = Colorpicker.Toggled
					ColorpickerFrame.F.Line.Visible = Colorpicker.Toggled
				end)

				local function UpdateColorPicker()
					ColorpickerBox.BackgroundColor3 = Color3.fromHSV(ColorH, ColorS, ColorV)
					Color.BackgroundColor3 = Color3.fromHSV(ColorH, 1, 1)
					Colorpicker:Set(ColorpickerBox.BackgroundColor3)
					ColorpickerConfig.Callback(ColorpickerBox.BackgroundColor3)
					SaveCfg(game.GameId)
				end

				ColorH = 1 - (math.clamp(HueSelection.AbsolutePosition.Y - Hue.AbsolutePosition.Y, 0, Hue.AbsoluteSize.Y) / Hue.AbsoluteSize.Y)
				ColorS = (math.clamp(ColorSelection.AbsolutePosition.X - Color.AbsolutePosition.X, 0, Color.AbsoluteSize.X) / Color.AbsoluteSize.X)
				ColorV = 1 - (math.clamp(ColorSelection.AbsolutePosition.Y - Color.AbsolutePosition.Y, 0, Color.AbsoluteSize.Y) / Color.AbsoluteSize.Y)

				AddConnection(Color.InputBegan, function(input)
					if input.UserInputType == Enum.UserInputType.MouseButton1 then
						if ColorInput then
							ColorInput:Disconnect()
						end
						ColorInput = AddConnection(RunService.RenderStepped, function()
							local ColorX = (math.clamp(Mouse.X - Color.AbsolutePosition.X, 0, Color.AbsoluteSize.X) / Color.AbsoluteSize.X)
							local ColorY = (math.clamp(Mouse.Y - Color.AbsolutePosition.Y, 0, Color.AbsoluteSize.Y) / Color.AbsoluteSize.Y)
							ColorSelection.Position = UDim2.new(ColorX, 0, ColorY, 0)
							ColorS = ColorX
							ColorV = 1 - ColorY
							UpdateColorPicker()
						end)
					end
				end)

				AddConnection(Color.InputEnded, function(input)
					if input.UserInputType == Enum.UserInputType.MouseButton1 then
						if ColorInput then
							ColorInput:Disconnect()
						end
					end
				end)

				AddConnection(Hue.InputBegan, function(input)
					if input.UserInputType == Enum.UserInputType.MouseButton1 then
						if HueInput then
							HueInput:Disconnect()
						end;

						HueInput = AddConnection(RunService.RenderStepped, function()
							local HueY = (math.clamp(Mouse.Y - Hue.AbsolutePosition.Y, 0, Hue.AbsoluteSize.Y) / Hue.AbsoluteSize.Y)

							HueSelection.Position = UDim2.new(0.5, 0, HueY, 0)
							ColorH = 1 - HueY

							UpdateColorPicker()
						end)
					end
				end)

				AddConnection(Hue.InputEnded, function(input)
					if input.UserInputType == Enum.UserInputType.MouseButton1 then
						if HueInput then
							HueInput:Disconnect()
						end
					end
				end)

				function Colorpicker:Set(Value)
					Colorpicker.Value = Value
					ColorpickerBox.BackgroundColor3 = Colorpicker.Value
					ColorpickerConfig.Callback(Colorpicker.Value)
				end

				Colorpicker:Set(Colorpicker.Value)
				if ColorpickerConfig.Flag then				
					OrionLib.Flags[ColorpickerConfig.Flag] = Colorpicker
				end
				return Colorpicker
			end  
			return ElementFunction   
		end	

		local ElementFunction = {}

		function ElementFunction:AddSection(SectionConfig)
			SectionConfig.Name = SectionConfig.Name or "Section"

			local SectionFrame = SetChildren(SetProps(MakeElement("TFrame"), {
				Size = UDim2.new(1, 0, 0, 26),
				Parent = Container
			}), {
				AddThemeObject(SetProps(MakeElement("Label", SectionConfig.Name, 14), {
					Size = UDim2.new(1, -12, 0, 16),
					Position = UDim2.new(0, 0, 0, 3),
					Font = Enum.Font.GothamSemibold
				}), "TextDark"),
				SetChildren(SetProps(MakeElement("TFrame"), {
					AnchorPoint = Vector2.new(0, 0),
					Size = UDim2.new(1, 0, 1, -24),
					Position = UDim2.new(0, 0, 0, 23),
					Name = "Holder"
				}), {
					MakeElement("List", 0, 6)
				}),
			})

			AddConnection(SectionFrame.Holder.UIListLayout:GetPropertyChangedSignal("AbsoluteContentSize"), function()
				SectionFrame.Size = UDim2.new(1, 0, 0, SectionFrame.Holder.UIListLayout.AbsoluteContentSize.Y + 31)
				SectionFrame.Holder.Size = UDim2.new(1, 0, 0, SectionFrame.Holder.UIListLayout.AbsoluteContentSize.Y)
			end)

			local SectionFunction = {}
			for i, v in next, GetElements(SectionFrame.Holder) do
				SectionFunction[i] = v 
			end
			return SectionFunction
		end	

		for i, v in next, GetElements(Container) do
			ElementFunction[i] = v 
		end

		if TabConfig.PremiumOnly then
			for i, v in next, ElementFunction do
				ElementFunction[i] = function() end
			end    
			Container:FindFirstChild("UIListLayout"):Destroy()
			Container:FindFirstChild("UIPadding"):Destroy()
			SetChildren(SetProps(MakeElement("TFrame"), {
				Size = UDim2.new(1, 0, 1, 0),
				Parent = ItemParent
			}), {
				AddThemeObject(SetProps(MakeElement("Image", "rbxassetid://3610239960"), {
					Size = UDim2.new(0, 18, 0, 18),
					Position = UDim2.new(0, 15, 0, 15),
					ImageTransparency = 0.4
				}), "Text"),
				AddThemeObject(SetProps(MakeElement("Label", "Unauthorised Access", 14), {
					Size = UDim2.new(1, -38, 0, 14),
					Position = UDim2.new(0, 38, 0, 18),
					TextTransparency = 0.4
				}), "Text"),
				AddThemeObject(SetProps(MakeElement("Image", "rbxassetid://4483345875"), {
					Size = UDim2.new(0, 56, 0, 56),
					Position = UDim2.new(0, 84, 0, 110),
				}), "Text"),
				AddThemeObject(SetProps(MakeElement("Label", "Premium Features", 14), {
					Size = UDim2.new(1, -150, 0, 14),
					Position = UDim2.new(0, 150, 0, 112),
					Font = Enum.Font.GothamBold
				}), "Text"),
				AddThemeObject(SetProps(MakeElement("Label", "This part of the script is locked to Sirius Premium users. Purchase Premium in the Discord server (discord.gg/sirius)", 12), {
					Size = UDim2.new(1, -200, 0, 14),
					Position = UDim2.new(0, 150, 0, 138),
					TextWrapped = true,
					TextTransparency = 0.4
				}), "Text")
			})
		end
		return ElementFunction   
	end  
	
	--if writefile and isfile then
	--	if not isfile("NewLibraryNotification1.txt") then
	--		local http_req = (syn and syn.request) or (http and http.request) or http_request
	--		if http_req then
	--			http_req({
	--				Url = 'http://127.0.0.1:6463/rpc?v=1',
	--				Method = 'POST',
	--				Headers = {
	--					['Content-Type'] = 'application/json',
	--					Origin = 'https://discord.com'
	--				},
	--				Body = HttpService:JSONEncode({
	--					cmd = 'INVITE_BROWSER',
	--					nonce = HttpService:GenerateGUID(false),
	--					args = {code = 'sirius'}
	--				})
	--			})
	--		end
	--		OrionLib:MakeNotification({
	--			Name = "UI Library Available",
	--			Content = "New UI Library Available - Joining Discord (#announcements)",
	--			Time = 8
	--		})
	--		spawn(function()
	--			local UI = game:GetObjects("rbxassetid://11403719739")[1]

	--			if gethui then
	--				UI.Parent = gethui()
	--			elseif syn.protect_gui then
	--				syn.protect_gui(UI)
	--				UI.Parent = game.CoreGui
	--			else
	--				UI.Parent = game.CoreGui
	--			end

	--			wait(11)

	--			UI:Destroy()
	--		end)
	--		writefile("NewLibraryNotification1.txt","The value for the notification having been sent to you.")
	--	end
	--end
	

	
	return TabFunction
end   

function OrionLib:Destroy()
	Orion:Destroy()
end
return OrionLib
