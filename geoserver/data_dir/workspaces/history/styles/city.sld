<?xml version="1.0" encoding="UTF-8"?>
<StyledLayerDescriptor version="1.0.0"
  xsi:schemaLocation="http://www.opengis.net/sld http://schemas.opengis.net/sld/1.0.0/StyledLayerDescriptor.xsd" xmlns="http://www.opengis.net/sld"
  xmlns:ogc="http://www.opengis.net/ogc" xmlns:xlink="http://www.w3.org/1999/xlink" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
  <NamedLayer>
    <Name>city</Name>
    <UserStyle>
      <Name>city</Name>
      <Title>Bsaic Cities</Title>
      <FeatureTypeStyle>
        <Rule>
          <Title>city</Title>
          <TextSymbolizer>
      <Label>
        <ogc:PropertyName>period_name</ogc:PropertyName>
      </Label>
      <Font>
        <CssParameter name="font-family">Arial</CssParameter>
        <CssParameter name="font-size">16</CssParameter>
        <CssParameter name="font-style">normal</CssParameter>
        <CssParameter name="font-weight">bold</CssParameter>
      </Font>
             <LabelPlacement>
      <PointPlacement>
        <AnchorPoint>
          <AnchorPointX>0</AnchorPointX>
          <AnchorPointY>0</AnchorPointY>
        </AnchorPoint>
        <Displacement>
          <DisplacementX>2</DisplacementX>
          <DisplacementY>5</DisplacementY>
        </Displacement>
      </PointPlacement>
    </LabelPlacement>
            <Halo>
              <Fill>
                <CssParameter name="fill">#CEF6F5</CssParameter>
                <CssParameter name="fill-opacity">0.6</CssParameter>
              </Fill>
            </Halo>
            <Fill>
      <CssParameter name="fill">#000000</CssParameter>
    </Fill>
    </TextSymbolizer>
         
          <PointSymbolizer>
            <Graphic>
              <Mark>
                <WellKnownName>circle</WellKnownName>
                <Fill>
                  <CssParameter name="fill">
                    <ogc:Literal>#FFFFFF</ogc:Literal>
                  </CssParameter>
                </Fill>
                <Stroke>
                  <CssParameter name="stroke">
                    <ogc:Literal>#000000</ogc:Literal>
                  </CssParameter>
                  <CssParameter name="stroke-width">
                    <ogc:Literal>2</ogc:Literal>
                  </CssParameter>
                </Stroke>
              </Mark>
              <Opacity>
                <ogc:Literal>1.0</ogc:Literal>
              </Opacity>
              <Size>
                <ogc:Literal>6</ogc:Literal>
              </Size>

            </Graphic>
          </PointSymbolizer>
        </Rule>
      </FeatureTypeStyle>
    </UserStyle>
  </NamedLayer>
</StyledLayerDescriptor>