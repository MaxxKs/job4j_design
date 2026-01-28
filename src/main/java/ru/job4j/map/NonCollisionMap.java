package ru.job4j.map;

import java.util.ConcurrentModificationException;
import java.util.Iterator;
import java.util.NoSuchElementException;
import java.util.Objects;

public class NonCollisionMap<K, V> implements SimpleMap<K, V> {
    private static final float LOAD_FACTOR = 0.75f;

    private int capacity = 8;
    private int count = 0;
    private int modCount = 0;
    private MapEntry<K, V>[] table = new MapEntry[capacity];

    @Override
    public boolean put(K key, V value) {
        if ((float) count / capacity >= LOAD_FACTOR) {
            expand();
        }
        int i = indexTable(key);
        if (table[i] == null) {
            table[i] = new MapEntry<>(key, value);
            count++;
            modCount++;
            return true;
        } else {
            return false;
        }
    }

    @Override
    public V get(K key) {
        int i = indexTable(key);
        if (table[i] != null) {
            if (keysEqual(table[i].key, key)) {
                return table[i].value;
            }
        }
        return null;
    }

    @Override
    public boolean remove(K key) {
        int i = indexTable(key);
        if (table[i] != null) {
            if (keysEqual(table[i].key, key)) {
                table[i] = null;
                count--;
                modCount++;
                return true;
            }
        }
        return false;
    }

    @Override
    public Iterator<K> iterator() {
        return new Iterator<>() {

            int expectedModCount = modCount;
            int index = 0;

            @Override
            public boolean hasNext() {
                if (expectedModCount != modCount) {
                    throw new ConcurrentModificationException();
                }
                while (index < capacity && table[index] == null) {
                    index++;
                }
                return index < capacity;
            }

            @Override
            public K next() {
                if (!hasNext()) {
                    throw new NoSuchElementException();
                }
                K result = table[index].key;
                index++;
                return result;
            }
        };
    }

    private void expand() {
        MapEntry<K, V>[] newTable = new MapEntry[capacity * 2];
        for (MapEntry<K, V> mapEntry : table) {
            if (mapEntry != null) {
                int h = Objects.hashCode(mapEntry.key);
                int hash = hash(h);
                int index = hash & (newTable.length - 1);
                newTable[index] = mapEntry;
            }
        }
        capacity *= 2;
        table = newTable;
    }

    private int indexTable(K key) {
        int h = Objects.hashCode(key);
        int hash = hash(h);
        return indexFor(hash);
    }

    private boolean keysEqual(K key1, K key2) {
        return Objects.hashCode(key1) == Objects.hashCode(key2)
                && Objects.equals(key1, key2);
    }

    private int hash(int hashCode) {
        return hashCode ^ (hashCode >>> 16);
    }

    private int indexFor(int hash) {
        return hash & (table.length - 1);
    }

    private static class MapEntry<K, V> {
        K key;
        V value;

        public MapEntry(K key, V value) {
            this.key = key;
            this.value = value;
        }
    }
}