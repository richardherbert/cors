component {

    property name="wirebox" inject="wirebox";

    function preProcess( event, interceptData, buffer, rc, prc ) {
        var settings = wirebox.getInstance( dsl = "coldbox:moduleSettings:cors" );

        writeDump( var = settings.allowCredentials, output = "console" );

        event.setHTTPHeader( name = "Access-Control-Allow-Origin", value = settings.allowOrigins );
        event.setHTTPHeader( name = "Access-Control-Allow-Credentials", value = toString( settings.allowCredentials ) );

        if ( event.getHTTPMethod() == "OPTIONS" ) {
            var allowedHeaders = "";
            if ( isSimpleValue( settings.allowHeaders ) ) {
                allowedHeaders = settings.allowHeaders == "*" ?
                    event.getHTTPHeader( "Access-Control-Request-Headers", "" ) :
                    [ settings.allowHeaders ];
            }
            else {
                allowedHeaders = arrayToList( settings.allowHeaders, ", " );
            }
            event.setHTTPHeader( name = "Access-Control-Allow-Headers", value = allowedHeaders );
            event.setHTTPHeader( name = "Access-Control-Allow-Methods", value = arrayToList( settings.allowMethods, ", " ) );
            event.setHTTPHeader( name = "Access-Control-Max-Age", value = settings.maxAge );
        }
    }

}
