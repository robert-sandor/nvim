return function()
  vim.filetype.add({
    pattern = {
      -- Ansible
      ['.*/defaults/.*%.ya?ml'] = 'yaml.ansible',
      ['.*/host_vars/.*%.ya?ml'] = 'yaml.ansible',
      ['.*/group_vars/.*%.ya?ml'] = 'yaml.ansible',
      ['.*/group_vars/.*/.*%.ya?ml'] = 'yaml.ansible',
      ['.*/playbook.*%.ya?ml'] = 'yaml.ansible',
      ['.*/playbooks/.*%.ya?ml'] = 'yaml.ansible',
      ['.*/roles/.*/tasks/.*%.ya?ml'] = 'yaml.ansible',
      ['.*/roles/.*/handlers/.*%.ya?ml'] = 'yaml.ansible',
      ['.*/tasks/.*%.ya?ml'] = 'yaml.ansible',
      ['.*/molecule/.*%.ya?ml'] = 'yaml.ansible',
    },
  })

  vim.lsp.enable('ansiblels')
end
