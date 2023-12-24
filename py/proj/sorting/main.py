from random import randint

def sort_list(uns_list):
    auxiliary = []
    for i in range(len(uns_list)):
        sorted = True
        for j in range(len(uns_list) - i - 1):
            if uns_list[j] > uns_list[j+1]:
                uns_list[j], uns_list[j+1] = uns_list[j+1], uns_list[j]
            
            sorted = False

        if sorted: break
    return uns_list


def main():
    maxi = randint(5000, 50000)
    unsorted = [randint(0, maxi) for _ in range(maxi)]
    print("Unsorted: ", min(unsorted), " - ", max(unsorted))
    sorted_list = sort_list(unsorted)
    print("Sorted!")

if __name__ == "__main__":
    main()
