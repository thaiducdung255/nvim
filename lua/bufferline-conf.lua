local function numbers(opts)
   return string.format('%s.', opts.ordinal)
end

local function custom_filter(buf_number)
   -- filter out filetypes you don't want to see
   if vim.bo[buf_number].filetype ~= '<i-dont-want-to-see-this>' then
      return true
   end
   -- filter out by buffer name
   if vim.fn.bufname(buf_number) ~= '<buffer-name-I-dont-want>' then
      return true
   end
   -- filter out based on arbitrary rules
   -- e.g. filter out vim wiki buffer from tabline in your work repo
   if vim.fn.getcwd() == '<work-repo>' and vim.bo[buf_number].filetype ~= 'wiki' then
      return true
   end
end

local function format_name(buf)
   if buf.name:match('%.sample') then
      return
   end

   if buf.name:match('%.example') then
      return
   end

   return vim.fn.fnamemodify(buf.name, ':t:r')
end

local offsets = {
   { filetype = 'NvimTree', text = 'File Explorer' },
}

require('bufferline').setup {
   options = {
      -- numbers                 = numbers,
      indicator_icon          = '▎',
      modified_icon           = '●',
      left_trunc_marker       = '',
      right_trunc_marker      = '',
      name_formatter          = format_name,
      max_name_length         = 25,
      max_prefix_length       = 20,
      tab_size                = 18,
      diagnostics             = false,
      custom_filter           = custom_filter,
      show_buffer_icons       = true,
      show_buffer_close_icons = false,
      show_close_icon         = false,
      show_tab_indicators     = true,
      persist_buffer_sort     = true,
      separator_style         = 'slant',
      enforce_regular_tabs    = false,
      always_show_bufferline  = true,
      sort_by                 = 'id',
      offsets                 = offsets,
   }
}

Nmap('gb', ':BufferLinePick<CR>')
Nmap('gB', ':BufferLinePickClose<CR>')
