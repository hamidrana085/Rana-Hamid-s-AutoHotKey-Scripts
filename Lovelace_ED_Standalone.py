def main():
    primes = [2, 3, 5, 7, 11, 13, 17, 19, 23, 29]
    odds = [1, 3, 5, 7, 9, 11, 13, 15, 17, 19]
    shift = [p * o for p, o in zip(primes, odds)]
    while True:
        while True:
            choice = input("What you wanna do?:")
            if choice.lower() == 'e' or choice.lower() == 'd':
                break
            else:
                print("You stupid fuck, enter 'e' or 'd'.")

        if choice.lower() == 'e':
            user_input = input("Encode what?: ")
            encoded_string = encode_string(user_input, shift)
            print("Encoded String:", encoded_string)
        elif choice.lower() == 'd':
            user_input = input("Decode what?: ")
            decoded_string = decode_string(user_input, shift)
            print("Decoded String:", decoded_string)

        another = input("Wanna do another one? (y/n): ")
        if another.lower() != "y":
            break

def encode_string(string, shift):
    encoded_string = ""
    for i, char in enumerate(string):
        shift_value = shift[i % len(shift)]
        encoded_char = chr(((ord(char) - ord('a') + shift_value) % 26) + ord('a'))
        encoded_string += encoded_char
    return encoded_string

def decode_string(encoded_string, shift):
    decoded_string = ""
    for i, char in enumerate(encoded_string):
        shift_value = shift[i % len(shift)]
        decoded_char = chr(((ord(char) - ord('a') - shift_value) % 26) + ord('a'))
        decoded_string += decoded_char
    return decoded_string

if __name__ == "__main__":
    main()
