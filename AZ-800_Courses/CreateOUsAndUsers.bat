dsadd OU ou=AZ,DC=demo,DC=local
dsadd OU "ou=Phoenix,ou=AZ,DC=demo,DC=local"
dsadd OU "ou=Tucson,ou=AZ,DC=demo,DC=local"

dsadd OU "ou=Phoenix Admins,ou=Phoenix,ou=AZ,DC=demo,DC=local"

dsadd OU "OU=User Accounts,ou=Phoenix Admins,ou=Phoenix,ou=AZ,DC=demo,DC=local"
dsadd OU "OU=localputer Accounts,ou=Phoenix Admins,ou=Phoenix,ou=AZ,DC=demo,DC=local"

dsadd user "cn=PhoenixAdmin01,OU=User Accounts,ou=Phoenix Admins,ou=Phoenix,ou=AZ,DC=demo,DC=local" -mustchpwd no -disabled no -pwd Pa$$w0rd1234!
dsadd user "cn=PhoenixAdmin02,OU=User Accounts,ou=Phoenix Admins,ou=Phoenix,ou=AZ,DC=demo,DC=local" -mustchpwd no -disabled no -pwd Pa$$w0rd1234!
dsadd user "cn=PhoenixAdmin03,OU=User Accounts,ou=Phoenix Admins,ou=Phoenix,ou=AZ,DC=demo,DC=local" -mustchpwd no -disabled no -pwd Pa$$w0rd1234!
dsadd user "cn=PhoenixAdmin04,OU=User Accounts,ou=Phoenix Admins,ou=Phoenix,ou=AZ,DC=demo,DC=local" -mustchpwd no -disabled no -pwd Pa$$w0rd1234!
dsadd user "cn=PhoenixAdmin05,OU=User Accounts,ou=Phoenix Admins,ou=Phoenix,ou=AZ,DC=demo,DC=local" -mustchpwd no -disabled no -pwd Pa$$w0rd1234!
dsadd user "cn=PhoenixAdmin06,OU=User Accounts,ou=Phoenix Admins,ou=Phoenix,ou=AZ,DC=demo,DC=local" -mustchpwd no -disabled no -pwd Pa$$w0rd1234!
dsadd user "cn=PhoenixAdmin07,OU=User Accounts,ou=Phoenix Admins,ou=Phoenix,ou=AZ,DC=demo,DC=local" -mustchpwd no -disabled no -pwd Pa$$w0rd1234!
dsadd user "cn=PhoenixAdmin08,OU=User Accounts,ou=Phoenix Admins,ou=Phoenix,ou=AZ,DC=demo,DC=local" -mustchpwd no -disabled no -pwd Pa$$w0rd1234!
dsadd user "cn=PhoenixAdmin09,OU=User Accounts,ou=Phoenix Admins,ou=Phoenix,ou=AZ,DC=demo,DC=local" -mustchpwd no -disabled no -pwd Pa$$w0rd1234!


dsadd OU "ou=Phoenix Desktops,ou=Phoenix,ou=AZ,DC=demo,DC=local"


dsadd OU "ou=Phoenix Laptops,ou=Phoenix,ou=AZ,DC=demo,DC=local"
dsadd OU "ou=Phoenix Servers,ou=Phoenix,ou=AZ,DC=demo,DC=local"

dsadd OU "ou=Phoenix Users,ou=Phoenix,ou=AZ,DC=demo,DC=local"

dsadd user "cn=PhoenixUser01,ou=Phoenix Users,ou=Phoenix,ou=AZ,DC=demo,DC=local" -mustchpwd no -disabled no -pwd Pa$$w0rd1234!
dsadd user "cn=PhoenixUser02,ou=Phoenix Users,ou=Phoenix,ou=AZ,DC=demo,DC=local" -mustchpwd no -disabled no -pwd Pa$$w0rd1234!
dsadd user "cn=PhoenixUser03,ou=Phoenix Users,ou=Phoenix,ou=AZ,DC=demo,DC=local" -mustchpwd no -disabled no -pwd Pa$$w0rd1234!
dsadd user "cn=PhoenixUser04,ou=Phoenix Users,ou=Phoenix,ou=AZ,DC=demo,DC=local" -mustchpwd no -disabled no -pwd Pa$$w0rd1234!
dsadd user "cn=PhoenixUser05,ou=Phoenix Users,ou=Phoenix,ou=AZ,DC=demo,DC=local" -mustchpwd no -disabled no -pwd Pa$$w0rd1234!
dsadd user "cn=PhoenixUser06,ou=Phoenix Users,ou=Phoenix,ou=AZ,DC=demo,DC=local" -mustchpwd no -disabled no -pwd Pa$$w0rd1234!
dsadd user "cn=PhoenixUser07,ou=Phoenix Users,ou=Phoenix,ou=AZ,DC=demo,DC=local" -mustchpwd no -disabled no -pwd Pa$$w0rd1234!
dsadd user "cn=PhoenixUser08,ou=Phoenix Users,ou=Phoenix,ou=AZ,DC=demo,DC=local" -mustchpwd no -disabled no -pwd Pa$$w0rd1234!
dsadd user "cn=PhoenixUser09,ou=Phoenix Users,ou=Phoenix,ou=AZ,DC=demo,DC=local" -mustchpwd no -disabled no -pwd Pa$$w0rd1234!

dsadd OU "ou=Tucson Admins,ou=Tucson,ou=AZ,DC=demo,DC=local"

dsadd user "cn=TucsonAdmin01,ou=Tucson Admins,ou=Tucson,ou=AZ,DC=demo,DC=local" -mustchpwd no -disabled no -pwd Pa$$w0rd1234!
dsadd user "cn=TucsonAdmin02,ou=Tucson Admins,ou=Tucson,ou=AZ,DC=demo,DC=local" -mustchpwd no -disabled no -pwd Pa$$w0rd1234!
dsadd user "cn=TucsonAdmin03,ou=Tucson Admins,ou=Tucson,ou=AZ,DC=demo,DC=local" -mustchpwd no -disabled no -pwd Pa$$w0rd1234!
dsadd user "cn=TucsonAdmin04,ou=Tucson Admins,ou=Tucson,ou=AZ,DC=demo,DC=local" -mustchpwd no -disabled no -pwd Pa$$w0rd1234!
dsadd user "cn=TucsonAdmin05,ou=Tucson Admins,ou=Tucson,ou=AZ,DC=demo,DC=local" -mustchpwd no -disabled no -pwd Pa$$w0rd1234!
dsadd user "cn=TucsonAdmin06,ou=Tucson Admins,ou=Tucson,ou=AZ,DC=demo,DC=local" -mustchpwd no -disabled no -pwd Pa$$w0rd1234!
dsadd user "cn=TucsonAdmin07,ou=Tucson Admins,ou=Tucson,ou=AZ,DC=demo,DC=local" -mustchpwd no -disabled no -pwd Pa$$w0rd1234!
dsadd user "cn=TucsonAdmin08,ou=Tucson Admins,ou=Tucson,ou=AZ,DC=demo,DC=local" -mustchpwd no -disabled no -pwd Pa$$w0rd1234!
dsadd user "cn=TucsonAdmin09,ou=Tucson Admins,ou=Tucson,ou=AZ,DC=demo,DC=local" -mustchpwd no -disabled no -pwd Pa$$w0rd1234!


dsadd OU "ou=Tucson Desktops,ou=Tucson,ou=AZ,DC=demo,DC=local"
dsadd OU "ou=Tucson Laptops,ou=Tucson,ou=AZ,DC=demo,DC=local"
dsadd OU "ou=Tucson Servers,ou=Tucson,ou=AZ,DC=demo,DC=local"
dsadd OU "ou=Tucson Users,ou=Tucson,ou=AZ,DC=demo,DC=local"

dsadd user "cn=TucsonUser01,ou=Tucson Users,ou=Tucson,ou=AZ,DC=demo,DC=local" -mustchpwd no -disabled no -pwd Pa$$w0rd1234!
dsadd user "cn=TucsonUser02,ou=Tucson Users,ou=Tucson,ou=AZ,DC=demo,DC=local" -mustchpwd no -disabled no -pwd Pa$$w0rd1234!
dsadd user "cn=TucsonUser03,ou=Tucson Users,ou=Tucson,ou=AZ,DC=demo,DC=local" -mustchpwd no -disabled no -pwd Pa$$w0rd1234!
dsadd user "cn=TucsonUser04,ou=Tucson Users,ou=Tucson,ou=AZ,DC=demo,DC=local" -mustchpwd no -disabled no -pwd Pa$$w0rd1234!
dsadd user "cn=TucsonUser05,ou=Tucson Users,ou=Tucson,ou=AZ,DC=demo,DC=local" -mustchpwd no -disabled no -pwd Pa$$w0rd1234!
dsadd user "cn=TucsonUser06,ou=Tucson Users,ou=Tucson,ou=AZ,DC=demo,DC=local" -mustchpwd no -disabled no -pwd Pa$$w0rd1234!
dsadd user "cn=TucsonUser07,ou=Tucson Users,ou=Tucson,ou=AZ,DC=demo,DC=local" -mustchpwd no -disabled no -pwd Pa$$w0rd1234!
dsadd user "cn=TucsonUser08,ou=Tucson Users,ou=Tucson,ou=AZ,DC=demo,DC=local" -mustchpwd no -disabled no -pwd Pa$$w0rd1234!
dsadd user "cn=TucsonUser09,ou=Tucson Users,ou=Tucson,ou=AZ,DC=demo,DC=local" -mustchpwd no -disabled no -pwd Pa$$w0rd1234!

pause