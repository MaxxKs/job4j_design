package ru.job4j.iterator;

import static org.assertj.core.api.Assertions.assertThat;
import static org.assertj.core.api.Assertions.assertThatThrownBy;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import java.util.*;

class ListUtilsTest {

    private List<Integer> input;

    @BeforeEach
    void setUp() {
        input = new ArrayList<>(Arrays.asList(1, 3));
    }

    @Test
    void whenAddBefore() {
        ListUtils.addBefore(input, 1, 2);
        assertThat(input)
                .hasSize(3)
                .containsSequence(1, 2, 3);
    }

    @Test
    void whenAddBeforeWithInvalidIndex() {
        assertThatThrownBy(() -> ListUtils.addBefore(input, 3, 2))
                .isInstanceOf(IndexOutOfBoundsException.class);
    }

    @Test
    void whenAddBeforeAtStart() {
        ListUtils.addBefore(input, 0, 0);
        assertThat(input)
                .hasSize(3)
                .containsSequence(0, 1, 3);
    }

    @Test
    void whenAddAfter() {
        ListUtils.addAfter(input, 0, 2);
        assertThat(input)
                .hasSize(3)
                .containsSequence(1, 2, 3);
    }

    @Test
    void whenAddAfterWithInvalidIndex() {
        assertThatThrownBy(() -> ListUtils.addAfter(input, 3, 2))
                .isInstanceOf(IndexOutOfBoundsException.class);
    }

    @Test
    void whenRemoveIf() {
        ListUtils.removeIf(input, e -> e > 2);
        assertThat(input)
                .hasSize(1)
                .containsSequence(1);
    }

    @Test
    void whenRemoveIfEmpty() {
        input.clear();
        ListUtils.removeIf(input, e -> true);
        assertThat(input).isEmpty();
    }

    @Test
    void whenReplaceIf() {
        ListUtils.replaceIf(input, e -> e == 1, 3);
        assertThat(input)
                .hasSize(2)
                .containsSequence(3, 3);
    }

    @Test
    void whenRemoveAll() {
        List<Integer> elements = List.of(1, 2, 4, 5, 6, 7, 8, 9, 10);
        ListUtils.removeAll(input, elements);
        assertThat(input)
                .hasSize(1)
                .containsSequence(3);
    }

    @Test
    void whenRemoveAllEmpty() {
        ListUtils.removeAll(input, List.of(1, 3));
        assertThat(input).isEmpty();
    }
}