package ru.job4j.assertj;

import org.junit.jupiter.api.Test;

import static org.assertj.core.api.Assertions.*;

class BoxTest {
    @Test
    void isThisSphere() {
        Box box = new Box(0, 10);
        String name = box.whatsThis();
        assertThat(name).isNotNull()
                .isNotEmpty()
                .isNotBlank()
                .isEqualTo("Sphere");
    }

    @Test
    void isThisUnknownObject() {
        Box box = new Box(3, 10);
        String name = box.whatsThis();
        assertThat(name).isNotNull()
                .isNotEmpty()
                .isNotBlank()
                .isEqualTo("Unknown object");
    }

    @Test
    void isThisContainsFourVertex() {
        Box box = new Box(4, 14);
        int quantiVertex = box.getNumberOfVertices();
        assertThat(quantiVertex).isNotZero()
                .isPositive()
                .isEven()
                .isGreaterThan(1)
                .isEqualTo(4);
    }

    @Test
    void isThisInvalidVertex() {
        Box box = new Box(3, 14);
        int quantiVertex = box.getNumberOfVertices();
        assertThat(quantiVertex).isNotZero()
                .isNotPositive()
                .isEqualTo(-1);
    }

    @Test
    void whenTheFigureExistsItCube() {
        Box box = new Box(8, 7);
        boolean result = box.isExist();
        assertThat(result).isTrue();
    }

    @Test
    void whenTheFigureNotExists() {
        Box box = new Box(6, 7);
        boolean result = box.isExist();
        assertThat(result).isFalse();
    }

    @Test
    void whenGetAreaForCube() {
        Box box = new Box(8, 5);
        double square = box.getArea();
        assertThat(square).isGreaterThan(149.9D)
                .isLessThan(150.5D)
                .isEqualTo(150.0D);
    }

    @Test
    void whenVertexIsInvalid() {
        Box box = new Box(7, 5);
        double square = box.getArea();
        assertThat(square).isEqualTo(0.0D);
    }
}