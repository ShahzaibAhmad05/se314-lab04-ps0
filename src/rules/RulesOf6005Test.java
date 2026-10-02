/* Copyright (c) 2007-2016 MIT 6.005 course staff, all rights reserved.
 * Redistribution of original or derived work requires permission of course staff.
 */
package rules;

import static org.junit.Assert.*;

import org.junit.Test;

/**
 * JUnit tests for RulesOf6005.
 */
public class RulesOf6005Test {
    
    /**
     * Tests the mayUseCodeInAssignment method.
     */
    @Test
    public void testMayUseCodeInAssignment() {
        assertFalse("Expected false: un-cited publicly-available code",
                RulesOf6005.mayUseCodeInAssignment(false, true, false, false, false));
        assertTrue("Expected true: self-written required code",
                RulesOf6005.mayUseCodeInAssignment(true, false, true, true, true));
    }

    /**
     * Code written by yourself may be used whatever the other flags are,
     * since they are ignored when writtenByYourself is true.
     */
    @Test
    public void testOwnCodeAlwaysAllowed() {
        assertTrue("Expected true: self-written code, other flags all false",
                RulesOf6005.mayUseCodeInAssignment(true, false, false, false, false));
        assertTrue("Expected true: self-written code, not cited, implementation required",
                RulesOf6005.mayUseCodeInAssignment(true, true, false, false, true));
    }

    /**
     * External code that is public, cited and not course work may be used,
     * but only when the assignment does not require you to implement it.
     */
    @Test
    public void testCitedPublicCodeDependsOnImplementationRequired() {
        assertTrue("Expected true: cited publicly-available code, implementation not required",
                RulesOf6005.mayUseCodeInAssignment(false, true, false, true, false));
        assertFalse("Expected false: cited publicly-available code, implementation required",
                RulesOf6005.mayUseCodeInAssignment(false, true, false, true, true));
    }

    /**
     * Other students' course work, and code not available to the whole class,
     * may never be used, even when cited.
     */
    @Test
    public void testCourseWorkOrPrivateCodeNotAllowed() {
        assertFalse("Expected false: cited course work written by another student",
                RulesOf6005.mayUseCodeInAssignment(false, true, true, true, false));
        assertFalse("Expected false: cited code that is not available to others",
                RulesOf6005.mayUseCodeInAssignment(false, false, false, true, false));
    }
}
