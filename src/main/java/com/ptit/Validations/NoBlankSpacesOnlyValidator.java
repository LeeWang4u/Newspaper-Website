package com.ptit.Validations;
import jakarta.validation.ConstraintValidator;
import jakarta.validation.ConstraintValidatorContext;

public class NoBlankSpacesOnlyValidator implements ConstraintValidator<NoBlankSpacesOnly, String> {

    @Override
    public void initialize(NoBlankSpacesOnly noBlankSpacesOnly) {
    }

    @Override
    public boolean isValid(String field, ConstraintValidatorContext cxt) {
        return field != null && !field.trim().isEmpty();
    }

}
