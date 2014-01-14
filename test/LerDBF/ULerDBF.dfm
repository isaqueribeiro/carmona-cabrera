object frmLerDBF: TfrmLerDBF
  Left = 378
  Top = 246
  Width = 1305
  Height = 675
  BorderWidth = 4
  Caption = 'Carregar Arquivos DBF (By MARINHO, Isaque Ribeiro)'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Arquivo: TLabel
    Left = 0
    Top = 21
    Width = 1281
    Height = 25
    Align = alTop
    Alignment = taCenter
    Caption = 'Arquivo'
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlue
    Font.Height = -21
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object DirectoryEdit: TDirectoryEdit
    Left = 0
    Top = 0
    Width = 1281
    Height = 21
    Align = alTop
    NumGlyphs = 1
    TabOrder = 0
    OnChange = DirectoryEditChange
  end
  object FileListBox: TFileListBox
    Left = 0
    Top = 46
    Width = 241
    Height = 583
    Align = alLeft
    ItemHeight = 13
    Mask = '*.DBF'
    TabOrder = 1
    OnClick = FileListBoxClick
  end
  object DBGrid1: TDBGrid
    Left = 241
    Top = 46
    Width = 1040
    Height = 583
    Align = alClient
    DataSource = DataSource
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
  end
  object VKDBFNTX: TVKDBFNTX
    OEM = True
    SetDeleted = False
    FastPostRecord = False
    LookupOptions = []
    TrimInLocate = False
    TrimCType = False
    StorageType = pstFile
    AccessMode.AccessMode = 16
    AccessMode.OpenRead = True
    AccessMode.OpenWrite = False
    AccessMode.OpenReadWrite = False
    AccessMode.ShareExclusive = True
    AccessMode.ShareDenyWrite = False
    AccessMode.ShareDenyNone = False
    Crypt.Active = False
    Crypt.CryptMethod = cmNone
    BufferSize = 4096
    WaitBusyRes = 3000
    CreateNow = False
    DbfVersion = xBaseIII
    LobBlockSize = 512
    LockProtocol = lpClipperLock
    LobLockProtocol = lpClipperLock
    FoxTableFlag.TableFlag = 0
    FoxTableFlag.HasGotIndex = False
    FoxTableFlag.HasGotMemo = False
    FoxTableFlag.ItIsDatabase = False
    Left = 32
    Top = 272
  end
  object DataSource: TDataSource
    DataSet = VKDBFNTX
    Left = 32
    Top = 320
  end
end
