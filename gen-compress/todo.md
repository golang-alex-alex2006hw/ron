# Платформы

- C++
- Go (есть 128 -> text)
- Java
- JavaScript
- (C)

# MVP

1. gen serialize_bin :: RonInternal128 -> RonBin
2. gen reduce :: [RonInternal128] -> RonInternal128

## serialize_bin

API — что-то общее, подобное итераторам, что можно обернуть в итераторы
целевого языка.

# Further

3. RonInternal128 -> RonBase64
4. idiomatic API for base types
5. DAO/API/mapper generator for user-defined types

# Profit

# RonInternal128

128 = uint64 & uint64

atom = uuid | int | float | string

string:
