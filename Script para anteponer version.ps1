$Filtro = Read-Host "Ingrese filtro de busqueda"
$Version = Read-Host "Ingrese número de versión"
Get-ChildItem -Path C:\Users\MACARDONA\Desktop\Otros\Biblioteca\sql\ -Filter "$Filto" |
ForEach-Object {  
	$Antes = 'V'+($_.name).ToString().split('V')[-1]
   	$newName = 'V'+$Version+'.'+($_.name).ToString().split('V')[-1]
   	Write-Host "El valor anterior era: "$Antes 
   	Rename-Item -Path $_.FullName -NewName $newName
   	Write-Host "El valor actual es: "$newName   	
}


