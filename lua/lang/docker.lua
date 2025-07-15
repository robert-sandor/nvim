return function()
  vim.filetype.add({
    pattern = {
      -- docker compose files
      ['docker-compose%.ya?ml'] = 'yaml.docker-compose',
      ['compose%.ya?ml'] = 'yaml.docker-compose',
    },
  })

  vim.lsp.enable('docker_compose_language_service')
end
