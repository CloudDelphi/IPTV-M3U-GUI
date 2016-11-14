UNIT ChannelAddresses;

INTERFACE

  USES
    System.Classes;

  TYPE
    TChannelAddress = CLASS(TObject)
      PRIVATE
        FActive: Boolean;
        FURL   : STRING;
        PROCEDURE SetActive(CONST Value: Boolean);
        PROCEDURE SetURL(CONST Value: STRING);
      PUBLIC
        CONSTRUCTOR Create;
        DESTRUCTOR Destroy; OVERRIDE;
      PUBLISHED
        PROPERTY Active: Boolean READ FActive WRITE SetActive;
        PROPERTY URL   : STRING READ FURL WRITE SetURL;
    END;

    TChannelAddresses = CLASS(TObject)
      PRIVATE
        FItems: TList;
        FUNCTION GetCount: Integer;
        FUNCTION GetItems(Index: Integer): TChannelAddress;
      PUBLIC
        CONSTRUCTOR Create;
        DESTRUCTOR Destroy; OVERRIDE;
        PROPERTY Count: Integer READ GetCount;
        PROPERTY Items[INDEX: Integer]: TChannelAddress READ GetItems; DEFAULT;
    END;

IMPLEMENTATION

  USES
    System.SysUtils;

  CONSTRUCTOR TChannelAddress.Create;
    BEGIN
      INHERITED Create;
      FURL    := '';
      FActive := True;
    END;

  DESTRUCTOR TChannelAddress.Destroy;
    BEGIN
      FActive := False;
      FURL    := '';
      INHERITED Destroy;
    END;

  PROCEDURE TChannelAddress.SetActive(CONST Value: Boolean);
    BEGIN
      FActive := Value;
    END;

  PROCEDURE TChannelAddress.SetURL(CONST Value: STRING);
    BEGIN
      FURL := Value;
    END;

  CONSTRUCTOR TChannelAddresses.Create;
    BEGIN
      INHERITED Create;
      FItems := TList.Create;
    END;

  DESTRUCTOR TChannelAddresses.Destroy;
    BEGIN
      FreeAndNil(FItems);
      INHERITED Destroy;
    END;

  FUNCTION TChannelAddresses.GetCount: Integer;
    BEGIN
      Result := FItems.Count;
    END;

  FUNCTION TChannelAddresses.GetItems(Index: Integer): TChannelAddress;
    BEGIN
      Result := TChannelAddress(FItems[INDEX]);
    END;

END.
