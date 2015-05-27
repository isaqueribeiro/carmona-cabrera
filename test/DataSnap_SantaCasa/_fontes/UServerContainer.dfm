object ServerContainer: TServerContainer
  OldCreateOrder = False
  Height = 271
  Width = 415
  object DSServer: TDSServer
    Left = 96
    Top = 11
  end
  object DSAuthenticationManager: TDSAuthenticationManager
    OnUserAuthenticate = DSAuthenticationManagerUserAuthenticate
    OnUserAuthorize = DSAuthenticationManagerUserAuthorize
    Roles = <>
    Left = 96
    Top = 61
  end
  object DSServerClass: TDSServerClass
    OnGetClass = DSServerClassGetClass
    Server = DSServer
    Left = 128
    Top = 11
  end
end
