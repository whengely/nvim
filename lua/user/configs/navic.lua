local ok, navic = pcall(require, 'nvim-navic')
if not ok then return end

navic.setup {
    highlight = false,
    separator = " > ",
    depth_limit = 0,
    depth_limit_indicator = "..",
}
