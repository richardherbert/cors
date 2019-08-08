component {

    this.name = "cors";
    this.author = "Eric Peterson";
    this.webUrl = "https://github.com/elpete/cors";

    function configure() {
        settings = {
            allowOrigins = function( event ) {
                return event.getHTTPHeader( "Origin", "*" );
            },
            allowMethods = function( event ) {
                return event.getHTTPMethod();
            },
            allowHeaders = [ "Content-Type", "X-Auth-Token", "Origin", "Authorization" ],
            maxAge = 60 * 60 * 24, // 1 day
            allowCredentials = true,
            eventPattern = ".*"
        };

        interceptors = [
            { class = "#moduleMapping#.interceptors.CORS" }
        ];
    }

}
