/**
 * Karlsruher Institut fuer Technologie
 * Institut fuer Technische Informatik (ITEC) 
 * Vorlesung Rechnerorganisation
 *
 * Autor: Velislav Slavov
 * Matrikelnummer: 2385786
 * Tutoriumsnummer: 6
 * Name des Tutors: Jonas Heinle
 *
 */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>


#define MIN_CAPITAL_LETTER 'A'
#define MAX_CAPITAL_LETTER 'Z'
#define MIN_LOWERCASE_LETTER 'a'
#define MAX_LOWERCASE_LETTER 'z'


/**
 * Returns the length of the given text.
 * \param text
 * \return the length of text
 */
static unsigned int stringLength(char* text)
{
    /************************/
    /** put your code here **/
    int length = 0;
    char* curChar = text;

    while (*curChar != '\0') {
        length++;
        curChar += 1;
    }

    return length;
    
    
    /************************/
}


/**
 * create a buffer which is as big as text
 *
 * \param text
 * \return char* buffer
 */
static char* createBuffer(char* text)
{
    // allocate the buffer memory
    // + 1 for the trailing \0
    int bufferSize = stringLength(text) + 1;
    // allocate and set the buffer to 0
    char* buffer = (char*)calloc(bufferSize, sizeof(char));

    return buffer;
}


/**
 * Checks if the given character's code is within a certain range.
 */
static int isInRange(long charToCheck, char min, char max) {
    return (charToCheck >= (long)min) && (charToCheck <= (long)max);
}


/**
 * Checks if the given character is a capital letter
 */
static int isCapitalLetter(char charToCheck) {
    return isInRange(charToCheck, MIN_CAPITAL_LETTER, MAX_CAPITAL_LETTER);
}


/**
 * Checks if the given character is a lowercase letter
 */
static int isLowercaseLetter(char charToCheck) {
    return isInRange(charToCheck, MIN_LOWERCASE_LETTER, MAX_LOWERCASE_LETTER);
}


/**
 * Checks if the given character is a letter
 */
static int isLetter(char charToCheck) {
    int isCapital = isCapitalLetter(charToCheck);
    int isLowercase = isLowercaseLetter(charToCheck);
    return isCapital || isLowercase;
}


/**
 * Calculates the equivalent of a character relative to a certain range
 */
static char calcCharRelativeToRange(long c, char min, char max) {
    if (isInRange(c, min, max))
        return c;

    char newChar;
    int charRangeSize = max - min + 1;
    if (c < min) {
        long totalStepsFromEnd = min - c - 1;
        long relativeStepsFromEnd = totalStepsFromEnd % charRangeSize;
        newChar = max - relativeStepsFromEnd;
    } else {
        long totalStepsFromStart = c - max - 1;
        long relativeStepsFromStart = totalStepsFromStart % charRangeSize;
        newChar = min + relativeStepsFromStart;
    }

    return newChar;
}


/**
 * if c is a letter it will be rotated by n
 * \param c the character
 * \param n the rotate offset
 * \return the rotated character
 */
static char rotateChar(char c, long n)
{
    /************************/
    /** put your code here **/
    if (isLetter(c)) {
        char minChar = MIN_CAPITAL_LETTER;
        char maxChar = MAX_CAPITAL_LETTER;

        if (isLowercaseLetter(c)) {
            minChar = MIN_LOWERCASE_LETTER;
            maxChar = MAX_LOWERCASE_LETTER;
        }

        long nextCharCode = n + (long)c;
        return calcCharRelativeToRange(nextCharCode, minChar, maxChar);
    }

    return c;
    /************************/
}


/**
 * Returns the crypted string of text.
 *
 * \param text to encrypt.
 * \param key
 * \return crypted text
 */
static char* encrypt(char* text, long key)
{
    /************************/
    /** put your code here **/
    char* encryptedText = createBuffer(text);
    int textSize = stringLength(text);
    for (int i=0; i<textSize; i++) {
        *(encryptedText+i) = rotateChar(*(text+i), key);
    }

    // Adding null char at the end just in case
    *(encryptedText+textSize) = '\0';

    return encryptedText;
    /************************/
}


/**
 * Returns the decrypted string of crypted.
 *
 * \param crypted
 * \param key
 * \return crypted text
 */
static char* decrypt(char* crypted, long key)
{
    /************************/
    /** put your code here **/
    return encrypt(crypted, -key);

    /************************/
}


#ifndef TEST
/**
 * main method
 * Queries the number to use as input parameter for the function calls
 *
 * \param argc unused
 * \param argv unused
 * \return returns 0
 */
int main(int argc, char* argv[])
{
    char plain[256];
    int key;

    printf("Bitte geben Sie einen Text ein:\n> ");
    // fgets(plain, 256, stdin);
    scanf("%255[^\n]", plain);

    printf("Bitte geben Sie einen Schluessel ein:\n> ");
    scanf("%i", &key);

    char* crypted = encrypt(plain, key);
    printf("crypted:   %s\n", crypted);
    char* decrypted = decrypt(crypted, key);
    printf("decrypted: %s\n", decrypted);

    free(crypted);
    free(decrypted);
    return 0;
}
#endif
