
package com.itgacl.magic4j.common.validator;


import com.itgacl.magic4j.libcommon.exception.IncorrectParameterException;

import java.util.UUID;

public class Validator {

    public static void validateString(String val, String errorMessage) {
        if (val == null || val.isEmpty()) {
            throw new IncorrectParameterException(errorMessage);
        }
    }

    public static void validatePositiveNumber(long val, String errorMessage) {
        if (val <= 0) {
            throw new IncorrectParameterException(errorMessage);
        }
    }

    public static void validateId(UUID id, String errorMessage) {
        if (id == null) {
            throw new IncorrectParameterException(errorMessage);
        }
    }

    public static void validateId(Long id, String errorMessage) {
        if (id == null) {
            throw new IncorrectParameterException(errorMessage);
        }
    }

    public static void validateId(String id, String errorMessage) {
        validateString(id,errorMessage);
    }

}
