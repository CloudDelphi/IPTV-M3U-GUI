UNIT Channels;

INTERFACE

  USES
    Unit3;

  TYPE
    TChannel = CLASS(TObject)
      PRIVATE
        FChannels  : TChannelAddresses;
        FGroupTitle: STRING;
        FName      : STRING;
        FTvgID     : STRING;
        FTvgLogo   : STRING;
        PROCEDURE SetChannels(CONST Value: TChannelAddresses);
        PROCEDURE SetGroupTitle(CONST Value: STRING);
        PROCEDURE SetName(CONST Value: STRING);
        PROCEDURE SetTvgID(CONST Value: STRING);
        PROCEDURE SetTvgLogo(CONST Value: STRING);
      PUBLIC
        CONSTRUCTOR Create;
        DESTRUCTOR Destroy; OVERRIDE;
      PUBLISHED
        PROPERTY Channels  : TChannelAddresses READ FChannels WRITE SetChannels;
        PROPERTY GroupTitle: STRING READ FGroupTitle WRITE SetGroupTitle;
        PROPERTY NAME      : STRING READ FName WRITE SetName;
        PROPERTY TvgID     : STRING READ FTvgID WRITE SetTvgID;
        PROPERTY TvgLogo   : STRING READ FTvgLogo WRITE SetTvgLogo;
    END;

IMPLEMENTATION

  USES
    System.SysUtils;

  CONSTRUCTOR TChannel.Create;
    BEGIN
      INHERITED Create;
      FTvgID      := '';
      FTvgLogo    := '';
      FGroupTitle := '';
      FName       := '';
      FChannels   := TChannelAddresses.Create();
    END;

  DESTRUCTOR TChannel.Destroy;
    BEGIN
      FreeAndNil(FChannels);
      FName    := '';
      FTvgLogo := '';
      FTvgLogo := '';
      FTvgID   := '';
      INHERITED Destroy;
    END;

  PROCEDURE TChannel.SetChannels(CONST Value: TChannelAddresses);
    BEGIN
      FChannels := Value;
    END;

  PROCEDURE TChannel.SetGroupTitle(CONST Value: STRING);
    BEGIN
      FGroupTitle := Value;
    END;

  PROCEDURE TChannel.SetName(CONST Value: STRING);
    BEGIN
      FName := Value;
    END;

  PROCEDURE TChannel.SetTvgID(CONST Value: STRING);
    BEGIN
      FTvgID := Value;
    END;

  PROCEDURE TChannel.SetTvgLogo(CONST Value: STRING);
    BEGIN
      FTvgLogo := Value;
    END;

END.
