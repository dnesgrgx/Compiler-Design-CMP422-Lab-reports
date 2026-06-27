# Lab 3: Token Counter for Identifiers, Keywords & Operators Using Flex 

## Objective

**To develop a lexical analyzer using Flex that scans input code and:**
- **Identifies tokens like keywords, identifiers, numbers, operators, and comments.** 
- **Counts how many of each token type appears.** 

---

## Software Requirements

| **Tools** | **Purpose** |
|-----------|-------------|
| Flex | Lexical Analyzer Generator |
| GCC | C Compiler to compile generated code |
| OS | Windows (MinGW) |

---

## Theory

The purpose of a lexical analyzer is not only to recognize tokens but also to track their frequency for further compiler stages like optimization or symbol table generation. 
In this experiment we: 
- Use regular expressions to define token types (keywords, identifiers, operators, 
etc.). 
- Maintain counters for each token type. 
- Use Flex actions { ... } to print and count each token. 

---

## Program Structure

---

## Compilation and Execution Steps

```
win_flex token-counter.l 
gcc lex.yy.c -o token-counter 
./token-counter 
```

---

## Output

```
Enter the code (Ctrl+Z then Enter to end input):
int x = 5; 
KEYWORD: int
IDENTIFIER: x
OPERATOR: =
NUMBER: 5
DELIMITER: ;

if (x > 2) x = x + 1; 
KEYWORD: if
DELIMITER: (
IDENTIFIER: x
OPERATOR: >
NUMBER: 2
DELIMITER: )
IDENTIFIER: x
OPERATOR: =
IDENTIFIER: x
OPERATOR: +
NUMBER: 1
DELIMITER: ;

^Z

-- Token Counts --
Keywords    : 2
Identifiers : 4
Numbers     : 3
Strings     : 0
Logical Ops : 0
Operators   : 4
Delimiters  : 4
Comments    : 0
Unknown     : 0
```

---

## Result

- The lex program successfully detected and printed all relevant tokens. 
- Counted token types such as keywords, operators, etc. 
- Displayed the final count summary at the end of execution. 

--- 

## Conclusion

This lab successfully demonstrated the implementation of a lexical analyzer using Flex for tokenizing and counting various token types in source code. Through regular expressions and Flex actions, we effectively identified keywords, identifiers, operators, delimiters, and numbers while maintaining accurate frequency counts. This foundational understanding of lexical analysis is essential for developing more complex compiler components and understanding how programming languages process source code at the lowest level.

---

_Thank you!_