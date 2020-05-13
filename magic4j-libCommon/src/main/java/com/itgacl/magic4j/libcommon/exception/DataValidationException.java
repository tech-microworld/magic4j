package com.itgacl.magic4j.libcommon.exception;

public class DataValidationException extends RuntimeException {

    private static final long serialVersionUID = 7659985660312721830L;

    public DataValidationException(String message) {
        super(message);
    }

    public DataValidationException(String message, Throwable cause) {
        super(message, cause);
    }
}
