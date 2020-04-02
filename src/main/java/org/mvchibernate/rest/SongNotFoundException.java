package org.mvchibernate.rest;

public class SongNotFoundException extends RuntimeException{
    public SongNotFoundException (String message){
        super(message);
    }
}
