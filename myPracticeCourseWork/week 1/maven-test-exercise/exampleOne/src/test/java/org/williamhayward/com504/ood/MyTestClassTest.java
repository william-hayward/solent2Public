/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.williamhayward.com504.ood;

import static org.junit.Assert.*;
import org.junit.Test;

/**
 *
 * @author epick
 */
public class MyTestClassTest {

    @Test
    public void shouldAnswerWithTrue() {
        MyTestClassLog4j newTest = new MyTestClassLog4j();
        newTest.writeAboutMe();
    }
}
