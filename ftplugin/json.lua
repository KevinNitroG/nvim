local conform_ok, _ = pcall(require, "conform")
if conform_ok then
  vim.bo.formatexpr = "v:lua.require'conform'.formatexpr()"
  vim.bo.formatprg = ""
elseif vim.fn.executable "jq" == 1 then
  vim.bo.formatexpr = ""
  vim.bo.formatprg = "jq"
end
