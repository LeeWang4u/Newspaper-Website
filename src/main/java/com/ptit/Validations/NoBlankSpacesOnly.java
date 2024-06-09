package com.ptit.Validations;

import jakarta.validation.Constraint;
import jakarta.validation.Payload;

import java.lang.annotation.*;

@Documented
@Target({ElementType.METHOD, ElementType.FIELD})
@Retention(RetentionPolicy.RUNTIME)
@Constraint(validatedBy = NoBlankSpacesOnlyValidator.class)
public @interface NoBlankSpacesOnly {
    String message() default "Invalid input";
    Class<?>[] groups() default {};
    Class<? extends Payload>[] payload() default {};
}