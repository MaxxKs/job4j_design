package ru.job4j.generic;

import org.junit.jupiter.api.Test;
import static org.assertj.core.api.Assertions.*;

class RoleStoreTest {

    @Test
    void whenAddAndFindThenRoleNameIsDoctor() {
        RoleStore store = new RoleStore();
        store.add(new Role("1", "Doctor"));
        Role result = store.findById("1");
        assertThat(result.getRoleName()).isEqualTo("Doctor");
    }

    @Test
    void whenAddAndFindThenRoleNameIsNull() {
        RoleStore store = new RoleStore();
        store.add(new Role("1", "Doctor"));
        Role result = store.findById("7");
        assertThat(result).isNull();
    }

    @Test
    void whenAddDuplicateAndFindRoleNameIsDoctor() {
        RoleStore store = new RoleStore();
        store.add(new Role("1", "Doctor"));
        store.add(new Role("1", "Driver"));
        Role result = store.findById("1");
        assertThat(result.getRoleName()).isEqualTo("Doctor");
    }

    @Test
    void whenReplaceThenRoleNameIsDriver() {
        RoleStore store = new RoleStore();
        store.add(new Role("1", "Doctor"));
        store.replace("1", new Role("1", "Driver"));
        Role result = store.findById("1");
        assertThat(result.getRoleName()).isEqualTo("Driver");
    }

    @Test
    void whenNoReplaceRoleThenNoChangeRolename() {
        RoleStore store = new RoleStore();
        store.add(new Role("1", "Doctor"));
        store.replace("10", new Role("10", "Driver"));
        Role result = store.findById("1");
        assertThat(result.getRoleName()).isEqualTo("Doctor");
    }

    @Test
    void whenDeleteRoleThenRoleIsNull() {
        RoleStore store = new RoleStore();
        store.add(new Role("1", "Doctor"));
        store.delete("1");
        Role result = store.findById("1");
        assertThat(result).isNull();
    }

    @Test
    void whenNoDeleteRoleThenRoleNameIsDoctor() {
        RoleStore store = new RoleStore();
        store.add(new Role("1", "Doctor"));
        store.delete("10");
        Role result = store.findById("1");
        assertThat(result.getRoleName()).isEqualTo("Doctor");
    }

    @Test
    void whenReplaceOkThenTrue() {
        RoleStore store = new RoleStore();
        store.add(new Role("1", "Doctor"));
        boolean result = store.replace("1", new Role("1", "Driver"));
        assertThat(result).isTrue();
    }

    @Test
    void whenReplaceNotOkThenFalse() {
        RoleStore store = new RoleStore();
        store.add(new Role("1", "Doctor"));
        boolean result = store.replace("10", new Role("10", "Driver"));
        assertThat(result).isFalse();
    }
}