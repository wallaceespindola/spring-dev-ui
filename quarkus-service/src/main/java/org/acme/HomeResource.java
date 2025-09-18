package org.acme;

import jakarta.ws.rs.GET;
import jakarta.ws.rs.Path;
import jakarta.ws.rs.Produces;
import jakarta.ws.rs.core.MediaType;

@Path("/")
public class HomeResource {

    @GET
    @Produces(MediaType.TEXT_HTML)
    public String home() {
        return "<!DOCTYPE html><html><head><meta http-equiv=\"refresh\" content=\"0;url=/index.html\"></head><body></body></html>";
    }
}
