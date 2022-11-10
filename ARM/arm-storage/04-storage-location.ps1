$rg = 'arm-introduction-04'
New-AzResourceGroup -Name $rg -Location northeurope -Force

New-AzResourceGroupDeployment -ResourceGroupName $rg `
    -TemplateFile '.\04-storage-location.json' `
    -TemplateParameterFile '.\04-storage-location.parameters.json' 