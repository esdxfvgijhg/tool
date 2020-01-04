function chgdir(dir, crypt)
	mutt.set("folder", dir)
	mutt.set("spoolfile", dir)
	mutt.set("record", dir)
	mutt.set("crypt_autosign", crypt)
end
