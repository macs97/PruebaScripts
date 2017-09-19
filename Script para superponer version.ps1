	$ArchivoGuardar = Read-Host "Ingrese nombre de version que desea guardar"
	$ArchivoGuardarExtension = $ArchivoGuardar + '.sql'
	Write-Host $ArchivoGuardarExtension
	$ArchivoExistente = Get-ChildItem -Path C:\Users\MACARDONA\Desktop\Otros\Biblioteca\sql\ -Filter "$ArchivoGuardarExtension"
	if($ArchivoExistente -eq $null)
	{
		$NoExiste = New-Object -ComObject Wscript.Shell
		$NoExiste.Popup("No existe ese archivo, puede guardar el script normalmente.",0,"Done",0x1)
	}	
	else
	{
		Write-Host "Existe el archivo" $ArchivoExistente
		if($ArchivoGuardarExtension -eq $ArchivoExistente)
		{		
			$Existe = New-Object -ComObject Wscript.Shell
			$Existe.Popup("Ya existe un archivo nombrado asi, se cambiara el nombre del script existente",0,"Done",0x1)				
			$Parte1= $ArchivoExistente.ToString().split('__sql')[0]
			$Parte2= $ArchivoExistente.ToString().split('__')[-1]
			$VersionSiguiente = [int](($ArchivoGuardar.ToString().split('.')[-1]).split('__')[0]) + 1
			$newName = $Parte1 +'.'+$VersionSiguiente +'__'+ $Parte2
			Write-Host $newName
			Rename-Item -Path C:\Users\MACARDONA\Desktop\Otros\Biblioteca\sql\$ArchivoExistente -NewName $newName
			$Respuesta = New-Object -ComObject Wscript.Shell
			$Respuesta.Popup("Ya puede guardar el script",0,"Done",0x1)
		}
		else
		{
			Write-Host "Son diferentes"
		}
	}