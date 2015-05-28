unit UConstantes;

interface

Uses
  Vcl.Forms,
  Web.WebReq;

  Type
    TPerfilLista = Array of String;

const
  KEY_PASSWORD  = 'Eu sei que meu Redentor vive!';
  USER_ADMIN    = 'admin';
  USER_NAME     = 'jonh_conner';
  USER_PASSWORD = 'masterkey@!21';

  INI_ARQUIVO             = 'Conexao.ini';
  INI_CONEXAO_DB          = 'ConexaoDB';
  INI_CONEXAO_DB_SERVIDOR = 'Servidor';
  INI_CONEXAO_DB_PORTA    = 'Porta';
  INI_CONEXAO_DB_BASE     = 'Base';
  INI_CONEXAO_DB_USUARIO  = 'Usuario';
  INI_CONEXAO_DB_SENHA    = 'Senha';

  table_perfil  = 'sys_perfil';
  table_usuario = 'sys_usuario';

implementation

end.
