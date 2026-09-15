return {
  { -- Diff/merge-conflict viewer
    'sindrets/diffview.nvim',
    cmd = { 'DiffviewOpen', 'DiffviewFileHistory', 'DiffviewClose' },
    keys = {
      { '<leader>gd', '<cmd>DiffviewOpen<cr>', desc = '[G]it [D]iff (open)' },
      { '<leader>gq', '<cmd>DiffviewClose<cr>', desc = '[G]it Diff [Q]uit' },
      { '<leader>gh', '<cmd>DiffviewFileHistory %<cr>', desc = '[G]it [H]istory (current file)' },
      { '<leader>gH', '<cmd>DiffviewFileHistory<cr>', desc = '[G]it [H]istory (all)' },
    },
    opts = {
      -- Conflicted files get their own layout: shows OURS/BASE/THEIRS panes
      -- plus the merge result, with a file panel listing every conflicted file.
      merge_tool = {
        layout = 'diff3_mixed',
        disable_diagnostics = true,
      },
    },
    init = function()
      -- lazy.nvim's `keys` spec doesn't forward `icon` to which-key, so register
      -- the group + per-key icons explicitly here.
      local ok, wk = pcall(require, 'which-key')
      if ok then
        wk.add {
          { '<leader>g', group = '[G]it Diff', icon = { icon = '󰊢', color = 'orange' } },
          { '<leader>gd', icon = { icon = '󰦓', color = 'yellow' } },
          { '<leader>gq', icon = { icon = '', color = 'red' } },
          { '<leader>gh', icon = { icon = '', color = 'cyan' } },
          { '<leader>gH', icon = { icon = '', color = 'blue' } },
        }
      end
    end,
  },
}
