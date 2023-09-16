---@diagnostic disable: undefined-global




local lush = require("lush")


local theme = lush(function(injected_functions)
  local sym = injected_functions.sym
  return {
    SpecialKey                             { fg="#383a42" },
    TermCursor                             { bg="#000000" },
    NonText                                { fg="#e6e6e6" },
    EndOfBuffer                            { NonText },
    Whitespace                             { NonText },
    TelescopePreviewHyphen                 { fg="#000000" },
    TelescopeResultsDiffUntracked          { TelescopePreviewHyphen },
    TelescopePromptCounter                 { TelescopePreviewHyphen },
    FidgetTask                             { TelescopePreviewHyphen },
    Directory                              { },
    StartupTimeTime                        { Directory },
    TelescopePreviewDate                   { Directory },
    TelescopePreviewDirectory              { Directory },
    ErrorMsg                               { cterm="underline", gui="underline", guisp="#d95717", },
    NvimInvalidSpacing                     { ErrorMsg },
    IncSearch                              { bg="#baceff",  },
    Search                                 { bg="#fce8f4", fg="#000000" },
    QuickFixLine                           { Search },
    Substitute                             { Search },
    TelescopePreviewMatch                  { Search },
    MoreMsg                                { fg="#383a42", },
    ModeMsg                                { fg="#383a42", },
    StartupTimeHeader                      { ModeMsg },
    LineNr                                 {  fg="#adadad", },
    LineNrAbove                            { LineNr },
    LineNrBelow                            { LineNr },
    TreesitterContextLineNumber            { LineNr, bg="#dddddd"},
    TelescopeResultsLineNr                 { LineNr },
    CursorLineNr                           { fg="#7a7a7a", },
    Question                               { fg="#067d17", },
    StatusLine                             { bg="#f2f2f2", },
    MsgSeparator                           { StatusLine },
    StatusLineNC                           { bg="#f2f2f2", fg="#383a42", },
    VertSplit                              { bg="#fafafa", fg="#383a42", },
    WinSeparator                           { VertSplit },
    Title                                  { fg="#50a14f", },
    StartupTimeStartupValue                { Title },
    LspInfoTitle                           { Title },
    FidgetTitle                            { Title },
    Visual                                 { bg="#a6d2ff", },
    TelescopePreviewLine                   { Visual },
    TelescopeSelection                     { Visual },
    NvimSurroundHighlight                  { Visual },
    WarningMsg                             { fg="#e45649", },
    WildMenu                               { fg="#383a42", },
    Folded                                 { bg="#f2f2f2", fg="#383a42", },
    FoldColumn                             { bg="#f2f2f2", fg="#383a42", },
    CursorLineFold                         { FoldColumn },
    DiffAdd                                { fg="#50a14f", },
    TelescopeResultsDiffAdd                { DiffAdd },
    DiffChange                             { fg="#c18401", },
    TelescopeResultsDiffChange             { DiffChange },
    DiffDelete                             { fg="#e45649", },
    TelescopeResultsDiffDelete             { DiffDelete },
    DiffText                               { fg="#001cac", },
    SignColumn                             { fg="#383a42", },
    CursorLineSign                         { SignColumn },
    Conceal                                { fg="#383a42", },
    SpellBad                               { sp="red", fg="#e45649", },
    SpellCap                               { sp="blue", fg="#c18401", },
    SpellRare                              { sp="magenta", fg="#c18401", },
    SpellLocal                             { sp="darkcyan", fg="#c18401", },
    Pmenu                                  { bg="#f2f2f2", fg="#383a42", },
    PmenuKind                              { Pmenu },
    PmenuExtra                             { Pmenu },
    NormalFloat                            { Pmenu },
    PmenuSel                               { Visual },
    PmenuKindSel                           { PmenuSel },
    PmenuExtraSel                          { PmenuSel },
    PmenuSbar                              { bg="#f2f2f2", },
    PmenuThumb                             { bg="#a0a1a7", },
    TabLine                                { bg="#f2f2f2", fg="#a0a1a7", },
    TabLineSel                             { bg="#383a42", fg="#fafafa", },
    TabLineFill                            { bg="#f2f2f2", fg="#a0a1a7", },
    CursorColumn                           { bg="#f2f2f2", },
    CursorLine                             { bg="#f2f2f2", },
    ColorColumn                            { bg="#f2f2f2", },
    WinBar                                 { gui="bold", },
    WinBarNC                               { WinBar },
    Cursor                                 { },
    FloatTitle                             { fg="#383a42", },
    -- lCursor                                { bg="fg", fg="bg", },
    Normal                                 { fg="#383a42", },
    NvimSpacing                            { Normal },
    StartupTimeStartupKey                  { Normal },
    StartupTimePlot                        { Normal },
    TelescopeNormal                        { Normal },
    CellularAutomatonNormal                { Normal },
    FloatShadow                            { bg="black", blend=80, },
    FloatShadowThrough                     { bg="black", blend=100, },
    RedrawDebugNormal                      { gui="reverse", },
    RedrawDebugClear                       { bg="yellow", },
    RedrawDebugComposed                    { bg="green", },
    RedrawDebugRecompose                   { bg="red", },
    Error                                  { fg="#e45649", },
    NvimInvalid                            { Error },
    Todo                                   { gui="bold,italic", fg="#008dde", },
    String                                 { fg="#067d17", },
    sym"@string"                           { String },
    NvimString                             { String },
    TelescopePreviewSize                   { String },
    TelescopePreviewExecute                { String },
    Constant                               { gui="bold", fg="#931697", },
    sym"@constant"                         { Constant },
    TelescopeResultsConstant               { Constant },
    TelescopePreviewGroup                  { Constant },
    TelescopePreviewUser                   { Constant },
    TelescopePreviewRead                   { Constant },
    TelescopePreviewBlock                  { Constant },
    TelescopePreviewCharDev                { Constant },
    TelescopePreviewPipe                   { Constant },
    Character                              { fg="#50a14f", },
    sym"@character"                        { Character },
    Number                                 { fg="#1750eb", },
    sym"@number"                           { Number },
    NvimNumber                             { Number },
    TelescopeResultsNumber                 { Number },
    Boolean                                { Number },
    sym"@boolean"                          { Boolean },
    Float                                  { Number },
    sym"@float"                            { Float },
    Function                               { fg="#00627a",gui="none" },
    sym"@function"                         { fg="#005f85",gui="bold" },
    sym"@function.call"                    { fg="#00627a", },
    sym"@method"                           { fg="red", gui="bold" },
    sym"@field"                            { fg="#871094" },
    TSFunction                             { fg="#005f85", gui="bold"},
    TSFunctionCall                         { fg="#006996", },
    TSMethod                               { TSFunction },
    TSMethodCall                           { TSFunctionCall },
    TelescopeResultsFunction               { Function },
    TelescopeResultsField                  { Function },
    TelescopeResultsClass                  { Function },
    LspInfoList                            { Function },
    Identifier                             { fg="#000000" },
    -- sym"@text.reference"                   { Identifier },
    sym"@parameter"                        { Identifier },
    sym"@property"                         { fg="#871094", gui="italic" },
    sym"@variable"                         { gui="nocombine" },
    sym"@namespace"                        { Identifier },
    sym"@lsp.type.parameter"               { fg="#871094", gui="italic" },
    NvimIdentifier                         { Identifier },
    StartupTimeOtherEvent                  { Identifier },
    TelescopePromptPrefix                  { Identifier },
    TelescopeMultiIcon                     { Identifier },
    TelescopeResultsIdentifier             { Identifier },
    Conditional                            { fg="#001cac", },
    sym"@conditional"                      { Conditional },
    Statement                              { fg="#001cac", },
    TelescopePreviewWrite                  { Statement },
    TelescopePreviewSocket                 { Statement },
    Repeat                                 { fg="#001cac", },
    sym"@repeat"                           { Repeat },
    Label                                  { fg="#20999d", gui="italic" },
    sym"@label"                            { Label },
    LspInfoBorder                          { Label },
    Operator                               { fg="#383a42", },
    sym"@operator"                         { Operator },
    NvimAssignment                         { Operator },
    NvimOperator                           { Operator },
    TelescopeResultsOperator               { Operator },
    Keyword                                { fg="#0033b3", },
    sym"@keyword"                          { Keyword },
    TelescopePreviewSticky                 { Keyword },
    Exception                              { fg="#a626a4", },
    sym"@exception"                        { Exception },
    Include                                { Keyword, },
    sym"@include"                          { Include },
    PreProc                                { fg="#9e880d", },
    sym"@preproc"                          { PreProc },
    Define                                 { fg="#a626a4", },
    sym"@define"                           { Define },
    Macro                                  { fg="#dd6718", },
    sym"@macro"                            { Macro },
    PreCondit                              { Keyword },
    StorageClass                           { Keyword },
    sym"@storageclass"                     { StorageClass },
    Type                                   { fg="#000000", },
    -- sym"@type"                             { fg="#871094", gui="italic" },
    NvimNumberPrefix                       { Type },
    NvimOptionSigil                        { Type },
    StartupTimeSourcingEvent               { Type },
    TelescopeMultiSelection                { Type },
    LspInfoFiletype                        { Type },
    Structure                              { Type, },
    sym"@lsp.type.namespace"               { Structure },
    Typedef                                { fg="#001cac", },
    sym"@type.definition"                  { Typedef },
    Tag                                    { fg="#383a42", },
    sym"@tag"                              { Tag },
    Special                                { fg="#001cac", },
    sym"@constructor"                      { Special },
    StartupTimePercent                     { Special },
    TelescopePreviewLink                   { Special },
    TelescopeMatching                      { Special },
    SpecialChar                            { fg="#383a42", },
    sym"@string.escape"                    { SpecialChar },
    sym"@string.special"                   { SpecialChar },
    sym"@character.special"                { SpecialChar },
    NvimRegister                           { SpecialChar },
    NvimStringSpecial                      { SpecialChar },
    TelescopeResultsVariable               { SpecialChar },
    Delimiter                              { fg="#6a959f", },
    sym"@punctuation"                      { fg="#000000" },
    NvimParenthesis                        { Delimiter },
    NvimColon                              { Delimiter },
    NvimComma                              { Delimiter },
    NvimArrow                              { Delimiter },
    SpecialComment                         { fg="#383a42", },
    TelescopeResultsSpecialComment         { SpecialComment },
    Debug                                  { fg="#383a42", },
    sym"@debug"                            { Debug },
    DiagnosticError                        { gui="underline", sp="red", },
    DiagnosticVirtualTextError             { DiagnosticError },
    DiagnosticFloatingError                { DiagnosticError },
    DiagnosticSignError                    { DiagnosticError },
    DiagnosticWarn                         { gui="underline", sp="orange", },
    DiagnosticVirtualTextWarn              { DiagnosticWarn },
    DiagnosticFloatingWarn                 { DiagnosticWarn },
    DiagnosticSignWarn                     { DiagnosticWarn },
    DiagnosticInfo                         { gui="underline", sp="lightblue", },
    DiagnosticVirtualTextInfo              { DiagnosticInfo },
    DiagnosticFloatingInfo                 { DiagnosticInfo },
    DiagnosticSignInfo                     { DiagnosticInfo },
    DiagnosticHint                         { gui="underline", sp="#cccccc", cterm="underline" },
    DiagnosticVirtualTextHint              { DiagnosticHint },
    DiagnosticFloatingHint                 { DiagnosticHint },
    DiagnosticSignHint                     { DiagnosticHint },
    DiagnosticOk                           { gui="underline", sp="lightgreen", },
    DiagnosticVirtualTextOk                { DiagnosticOk },
    DiagnosticFloatingOk                   { DiagnosticOk },
    DiagnosticSignOk                       { DiagnosticOk },
    DiagnosticUnderlineError               { sp="red", gui="underline", },
    DiagnosticUnderlineWarn                { sp="orange", gui="underline", },
    DiagnosticUnderlineInfo                { sp="lightblue", gui="underline", },
    DiagnosticUnderlineHint                { sp="lightgrey", gui="underline", },
    DiagnosticUnderlineOk                  { sp="lightgreen", gui="underline", },
    DiagnosticDeprecated                   { sp="red", gui="strikethrough", },
    Comment                                { gui="italic", fg="#8c8c8c", },
    DiagnosticUnnecessary                  { Comment },
    sym"@text.literal"                     { Comment },
    sym"@comment"                          { Comment },
    TelescopeResultsComment                { Comment },
    LspInfoTip                             { Comment },
    Underlined                             { gui="underline", sp="#c18401", },
    sym"@text.uri"                         { Underlined },
    sym"@text.underline"                   { Underlined },
    MatchParen                             { bg="#f5f5f5" },
    Ignore                                 { fg="#383a42", },
    NvimInternalError                      { bg="red", fg="red", },
    NvimFigureBrace                        { NvimInternalError },
    NvimSingleQuotedUnknownEscape          { NvimInternalError },
    NvimInvalidSingleQuotedUnknownEscape   { NvimInternalError },
    IndentBlanklineSpaceCharBlankline      { gui="nocombine", fg="#e6e6e6", },
    IndentBlanklineSpaceChar               { gui="nocombine", fg="#e6e6e6", },
    IndentBlanklineChar                    { gui="nocombine", fg="#e6e6e6", },
    IndentBlanklineContextStart            { sp="#001cac", gui="underline", },
    IndentBlanklineContextChar             { Comment },
    CmpItemAbbrDefault                     { fg="#383a42", },
    CmpItemAbbr                            { CmpItemAbbrDefault },
    CmpItemAbbrDeprecatedDefault           { fg="#a0a1a7", },
    CmpItemAbbrDeprecated                  { CmpItemAbbrDeprecatedDefault },
    CmpItemAbbrMatchDefault                { fg="#383a42", },
    CmpItemAbbrMatch                       { CmpItemAbbrMatchDefault },
    CmpItemAbbrMatchFuzzyDefault           { fg="#383a42", },
    CmpItemAbbrMatchFuzzy                  { CmpItemAbbrMatchFuzzyDefault },
    CmpItemKindDefault                     { fg="#001cac", },
    CmpItemKind                            { CmpItemKindDefault },
    CmpItemMenuDefault                     { fg="#383a42", },
    CmpItemMenu                            { CmpItemMenuDefault },
    OilDir                                 { },
    OilDirIcon                             { },
    OilSocket                              { },
    OilCreate                              { },
    OilDelete                              { },
    OilMove                                { },
    OilCopy                                { },
    OilChange                              { },
    minimapCursor                          { bg="#5f5f5f", fg="#ffff87", },
    minimapRange                           { bg="#4f4f4f", fg="#ffff87", },
    minimapDiffRemoved                     { fg="#fc1a70", },
    minimapDiffAdded                       { fg="#a4e400", },
    minimapDiffLine                        { fg="#af87ff", },
    minimapCursorDiffRemoved               { bg="#5f5f5f", fg="#fc1a70", },
    minimapCursorDiffAdded                 { bg="#5f5f5f", fg="#a4e400", },
    minimapCursorDiffLine                  { bg="#5f5f5f", fg="#af87ff", },
    minimapRangeDiffRemoved                { bg="#4f4f4f", fg="#fc1a70", },
    minimapRangeDiffAdded                  { bg="#4f4f4f", fg="#a4e400", },
    minimapRangeDiffLine                   { bg="#4f4f4f", fg="#af87ff", },
    DiffRemoved                            { fg="#e45649", },
    DiffAdded                              { fg="#50a14f", },
    DevIconVimrc                           { fg="#017226", },
    DevIconLicense                         { fg="#666620", },
    DevIconVerilog                         { fg="#017226", },
    DevIconMarkdown                        { fg="#36677c", },
    DevIconCoffee                          { fg="#666620", },
    DevIconClojureDart                     { fg="#36677c", },
    DevIconMakefile                        { fg="#526064", },
    DevIconAi                              { fg="#666620", },
    DevIconMdx                             { fg="#36677c", },
    DevIconSystemVerilog                   { fg="#017226", },
    DevIconBrewfile                        { fg="#701516", },
    DevIconCobol                           { fg="#005ca5", },
    DevIconEslintrc                        { fg="#4b32c3", },
    DevIconBabelrc                         { fg="#666620", },
    DevIconSml                             { fg="#975122", },
    DevIconClojureC                        { fg="#466024", },
    DevIconClojure                         { fg="#466024", },
    DevIconGitModules                      { fg="#41535b", },
    DevIconGitConfig                       { fg="#41535b", },
    DevIconRakefile                        { fg="#701516", },
    DevIconPsScriptModulefile              { fg="#4f5893", },
    DevIconPsManifestfile                  { fg="#4f5893", },
    DevIconDiff                            { fg="#41535b", },
    DevIconCsv                             { fg="#447028", },
    DevIconNPMIgnore                       { fg="#ae1d38", },
    DevIconCrystal                         { fg="#434343", },
    DevIconTor                             { fg="#36677c", },
    DevIconGvimrc                          { fg="#017226", },
    DevIconJson                            { fg="#666620", },
    DevIconC                               { fg="#3b69aa", },
    DevIconHpp                             { fg="#6b4d83", },
    DevIconHxx                             { fg="#6b4d83", },
    DevIconGo                              { fg="#36677c", },
    DevIconCxx                             { fg="#36677c", },
    DevIconCPlusPlus                       { fg="#a23253", },
    DevIconHbs                             { fg="#a04f1d", },
    DevIconConf                            { fg="#526064", },
    DevIconHh                              { fg="#6b4d83", },
    DevIconHaml                            { fg="#2f2f2d", },
    DevIconLua                             { fg="#366b8a", },
    DevIconXul                             { fg="#975122", },
    DevIconRss                             { fg="#7e4e1e", },
    DevIconGraphQL                         { fg="#ac2880", },
    DevIconPdf                             { fg="#b30b00", },
    DevIconTextResource                    { fg="#666620", },
    DevIconTextScene                       { fg="#6b4d83", },
    DevIconMotoko                          { fg="#654ca7", },
    DevIconGitLogo                         { fg="#b5391e", },
    DevIconFs                              { fg="#36677c", },
    DevIconFsx                             { fg="#36677c", },
    DevIconFsi                             { fg="#36677c", },
    DevIconOrgMode                         { fg="#4f7166", },
    DevIconYml                             { fg="#526064", },
    DevIconDesktopEntry                    { fg="#563d7c", },
    DevIconVala                            { fg="#562b86", },
    DevIconProlog                          { fg="#725c2a", },
    DevIconMli                             { fg="#975122", },
    DevIconCjs                             { fg="#666620", },
    DevIconTsx                             { fg="#1354bf", },
    DevIconHtm                             { fg="#aa391c", },
    DevIconKotlin                          { fg="#5f3ebf", },
    DevIconJl                              { fg="#6c4b7c", },
    DevIconH                               { fg="#6b4d83", },
    DevIconJson5                           { fg="#666620", },
    DevIconHs                              { fg="#6b4d83", },
    DevIconJs                              { fg="#666620", },
    DevIconJsx                             { fg="#158197", },
    DevIconPl                              { fg="#36677c", },
    DevIconWebmanifest                     { fg="#504b1e", },
    DevIconSig                             { fg="#975122", },
    DevIconKotlinScript                    { fg="#5f3ebf", },
    DevIconPp                              { fg="#80530d", },
    DevIconMd                              { fg="#333333", },
    DevIconSolidity                        { fg="#36677c", },
    DevIconRmd                             { fg="#36677c", },
    DevIconBashrc                          { fg="#447028", },
    DevIconTerraform                       { fg="#4732af", },
    DevIconVHDL                            { fg="#017226", },
    DevIconLess                            { fg="#563d7c", },
    DevIconPm                              { fg="#36677c", },
    DevIconTerminal                        { fg="#217929", },
    DevIconRb                              { fg="#701516", },
    DevIconBzl                             { fg="#447028", },
    DevIconGemspec                         { fg="#701516", },
    DevIconRake                            { fg="#701516", },
    DevIconSass                            { fg="#a33759", },
    DevIconSvg                             { fg="#80581e", },
    DevIconPrisma                          { fg="#333333", },
    DevIconPhp                             { fg="#6b4d83", },
    DevIconScss                            { fg="#a33759", },
    DevIconTFVars                          { fg="#4732af", },
    DevIconNix                             { fg="#3f5d72", },
    DevIconNim                             { fg="#514700", },
    DevIconDump                            { fg="#494848", },
    DevIconBazel                           { fg="#447028", },
    DevIconLuau                            { fg="#366b8a", },
    DevIconFavicon                         { fg="#666620", },
    DevIconMjs                             { fg="#504b1e", },
    DevIconZsh                             { fg="#447028", },
    DevIconFennel                          { fg="#33312b", },
    DevIconPackageLockJson                 { fg="#7a0d21", },
    DevIconJsonc                           { fg="#666620", },
    DevIconJava                            { fg="#992e33", },
    DevIconIni                             { fg="#526064", },
    DevIconAwk                             { fg="#3a4446", },
    DevIconLog                             { fg="#333333", },
    DevIconHeex                            { fg="#6b4d83", },
    DevIconDockerfile                      { fg="#2e5f99", },
    DevIconConfigRu                        { fg="#701516", },
    DevIconReScriptInterface               { fg="#a33759", },
    DevIconTcl                             { fg="#1e5cb3", },
    DevIconReScript                        { fg="#992e33", },
    DevIconErb                             { fg="#701516", },
    DevIconHrl                             { fg="#8a2b72", },
    DevIconMint                            { fg="#44604a", },
    DevIconMaterial                        { fg="#8a2b72", },
    DevIconGruntfile                       { fg="#975122", },
    DevIconEpp                             { fg="#80530d", },
    DevIconProcfile                        { fg="#6b4d83", },
    DevIconWebpack                         { fg="#36677c", },
    DevIconGodotProject                    { fg="#526064", },
    DevIconGulpfile                        { fg="#992e33", },
    DevIconFsharp                          { fg="#36677c", },
    DevIconDart                            { fg="#03589c", },
    DevIconRproj                           { fg="#286844", },
    DevIconCss                             { fg="#2c6ea3", },
    DevIconDsStore                         { fg="#41535b", },
    DevIconStyl                            { fg="#466024", },
    DevIconSql                             { fg="#494848", },
    DevIconSlim                            { fg="#aa391c", },
    DevIconPy                              { fg="#805e02", },
    DevIconRlib                            { fg="#6f5242", },
    DevIconEx                              { fg="#6b4d83", },
    DevIconGitCommit                       { fg="#41535b", },
    DevIconWasm                            { fg="#4539a4", },
    DevIconPyo                             { fg="#332d1d", },
    DevIconPyd                             { fg="#332d1d", },
    DevIconSln                             { fg="#643995", },
    DevIconXcPlayground                    { fg="#975122", },
    DevIconXls                             { fg="#207245", },
    DevIconPsb                             { fg="#36677c", },
    DevIconXlsx                            { fg="#207245", },
    DevIconPpt                             { fg="#983826", },
    DevIconBinaryGLTF                      { fg="#80581e", },
    DevIconFsscript                        { fg="#36677c", },
    DevIconEjs                             { fg="#666620", },
    DevIconDropbox                         { fg="#0049be", },
    DevIconDocx                            { fg="#185abd", },
    DevIconLock                            { fg="#5e5e5e", },
    DevIconCson                            { fg="#666620", },
    DevIconDoc                             { fg="#185abd", },
    DevIconZshrc                           { fg="#447028", },
    DevIconZshprofile                      { fg="#447028", },
    DevIconZshenv                          { fg="#447028", },
    DevIconTypeScriptReactTest             { fg="#1354bf", },
    DevIconSpecTs                          { fg="#36677c", },
    DevIconTestTs                          { fg="#36677c", },
    DevIconZig                             { fg="#7b4d0e", },
    DevIconYaml                            { fg="#526064", },
    DevIconBazelBuild                      { fg="#447028", },
    DevIconXml                             { fg="#975122", },
    DevIconVue                             { fg="#466024", },
    DevIconPackedResource                  { fg="#526064", },
    DevIconConfiguration                   { fg="#2f2f2f", },
    DevIconTwig                            { fg="#466024", },
    DevIconToml                            { fg="#526064", },
    DevIconTex                             { fg="#3d6117", },
    DevIconCp                              { fg="#36677c", },
    DevIconSvelte                          { fg="#bf2e00", },
    DevIconTxt                             { fg="#447028", },
    DevIconSh                              { fg="#3a4446", },
    DevIconScala                           { fg="#992e33", },
    DevIconsbt                             { fg="#992e33", },
    DevIconJavaScriptReactSpec             { fg="#158197", },
    DevIconJavaScriptReactTest             { fg="#158197", },
    DevIconLhs                             { fg="#6b4d83", },
    DevIconNodeModules                     { fg="#ae1d38", },
    DevIconPackageJson                     { fg="#ae1d38", },
    DevIconSpecJs                          { fg="#666620", },
    DevIconTestJs                          { fg="#666620", },
    DevIconTypeScriptReactSpec             { fg="#1354bf", },
    DevIconEditorConfig                    { fg="#333333", },
    DevIconTs                              { fg="#36677c", },
    DevIconFish                            { fg="#3a4446", },
    DevIconSuo                             { fg="#975122", },
    DevIconGitlabCI                        { fg="#aa321f", },
    DevIconOpenTypeFont                    { fg="#2f2f2f", },
    DevIconOPUS                            { fg="#a55c01", },
    DevIconLeex                            { fg="#6b4d83", },
    DevIconClojureJS                       { fg="#36677c", },
    DevIconCs                              { fg="#434d04", },
    DevIconMl                              { fg="#975122", },
    DevIconCMake                           { fg="#526064", },
    DevIconCMakeLists                      { fg="#526064", },
    DevIconPyc                             { fg="#332d1d", },
    DevIconFortran                         { fg="#563b70", },
    DevIconEnv                             { fg="#32310d", },
    DevIconBmp                             { fg="#6b4d83", },
    DevIconExs                             { fg="#6b4d83", },
    DevIconVagrantfile                     { fg="#104abf", },
    DevIconCsh                             { fg="#3a4446", },
    DevIconD                               { fg="#325a13", },
    DevIconSwift                           { fg="#975122", },
    DevIconKsh                             { fg="#3a4446", },
    DevIconVlang                           { fg="#3e5a7f", },
    DevIconGDScript                        { fg="#526064", },
    DevIconGif                             { fg="#6b4d83", },
    DevIconErl                             { fg="#8a2b72", },
    DevIconIco                             { fg="#666620", },
    DevIconSettingsJson                    { fg="#643995", },
    DevIconSvelteConfig                    { fg="#bf2e00", },
    DevIconElm                             { fg="#36677c", },
    DevIconGemfile                         { fg="#701516", },
    DevIconDb                              { fg="#494848", },
    DevIconJpg                             { fg="#6b4d83", },
    DevIconJpeg                            { fg="#6b4d83", },
    DevIconR                               { fg="#286844", },
    DevIconBazelWorkspace                  { fg="#447028", },
    DevIconGitIgnore                       { fg="#41535b", },
    DevIconGitAttributes                   { fg="#41535b", },
    DevIconMixLock                         { fg="#6b4d83", },
    DevIconRs                              { fg="#6f5242", },
    DevIconLiquid                          { fg="#4a6024", },
    DevIconPng                             { fg="#6b4d83", },
    DevIconImportConfiguration             { fg="#2f2f2f", },
    DevIconPsd                             { fg="#36677c", },
    DevIconMustache                        { fg="#975122", },
    DevIconVim                             { fg="#017226", },
    DevIconNPMrc                           { fg="#ae1d38", },
    DevIconDrools                          { fg="#553a3a", },
    DevIconHtml                            { fg="#ab3a1c", },
    DevIconBash                            { fg="#447028", },
    DevIconPsScriptfile                    { fg="#325698", },
    DevIconWebp                            { fg="#6b4d83", },
    DevIconEdn                             { fg="#36677c", },
    DevIconEex                             { fg="#6b4d83", },
    DevIconCpp                             { fg="#36677c", },
    DevIconBat                             { fg="#40500f", },
    DevIconScheme                          { fg="#000000", },
    DevIconBashProfile                     { fg="#447028", },
    DevIconQuery                           { fg="#607035", },
    VisualNOS                              { bg="#bfceff", },
    goPackage                              { fg="#001cac", },
    goImport                               { fg="#001cac", },
    goVar                                  { fg="#001cac", },
    goConst                                { fg="#001cac", },
    goFunction                             { fg="#005f85", gui="bold" },
    goFunctionCall                         { fg="#00968a", },
    goReceiverType                         { fg="#2469d2", },
    goReceiverVar                          { fg="#007074", },
    goStatement                            { fg="#001cac", },
    goConditional                          { fg="#001cac", },
    goLabel                                { fg="#001cac", },
    goRepeat                               { fg="#001cac", },
    goType                                 { fg="#001cac", },
    goSignedInts                           { fg="#001cac", },
    goUnsignedInts                         { fg="#001cac", },
    goFloats                               { fg="#001cac", },
    goComplexes                            { fg="#001cac", },
    goBuiltins                             { fg="#007074", },
    goBoolean                              { fg="#001cac", },
    goPredefinedIdentifiers                { fg="#001cac", },
    goDeclType                             { fg="#001cac", },
    goDeclaration                          { fg="#001cac", },
    goParamType                            { fg="#001cac", },
    typescriptBraces                       { fg="#383a42", },
    typescriptBlock                        { fg="#383a42", },
    GitGutterAdd                           { fg="#50a14f", },
    GitGutterDelete                        { fg="#e45649", },
    GitGutterChange                        { fg="#c18401", },
    GitGutterChangeDelete                  { fg="#e45649", },
    gitcommitComment                       { fg="#a0a1a7", },
    gitcommitUntracked                     { gitcommitComment },
    gitcommitDiscarded                     { gitcommitComment },
    gitcommitSelected                      { gitcommitComment },
    gitcommitUnmerged                      { fg="#e45649", },
    gitcommitOnBranch                      { fg="#383a42", },
    gitcommitBranch                        { fg="#a626a4", },
    gitcommitNoBranch                      { gitcommitBranch },
    gitcommitDiscardedType                 { fg="#e45649", },
    gitcommitSelectedType                  { fg="#50a14f", },
    gitcommitHeader                        { fg="#383a42", },
    gitcommitUntrackedFile                 { fg="#007074", },
    gitcommitDiscardedFile                 { fg="#e45649", },
    gitcommitDiscardedArrow                { gitcommitDiscardedFile },
    gitcommitSelectedFile                  { fg="#50a14f", },
    gitcommitSelectedArrow                 { gitcommitSelectedFile },
    gitcommitUnmergedFile                  { fg="#c18401", },
    gitcommitUnmergedArrow                 { gitcommitUnmergedFile },
    gitcommitFile                          { fg="#383a42", },
  }
end)
return theme