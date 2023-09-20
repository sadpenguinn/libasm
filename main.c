#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <unistd.h>
#include <errno.h>
#include <fcntl.h>

size_t	ft_strlen(const char *str);
char	*ft_strcpy(char *dest, char *src);
int		ft_strcmp(char *s1, char *s2);
ssize_t	ft_write(int fd, const void *buf, size_t count);
ssize_t	ft_read(int fd, void *buf, size_t count);
char	*ft_strdup(const char *s);

typedef struct ft_strlen_test_data {
	char	*str;
} ft_strlen_test_data;

void test_ft_strlen() {
	printf("#####################################################\n");
	printf("####                 FT_STRLEN                   ####\n");
	printf("#####################################################\n");

	int ft_strlen_cases_size = 7;
	ft_strlen_test_data ft_strlen_cases[ft_strlen_cases_size];

	ft_strlen_cases[0] = (ft_strlen_test_data){"test"};
	ft_strlen_cases[1] = (ft_strlen_test_data){"testqsfndkjq"};
	ft_strlen_cases[2] = (ft_strlen_test_data){"dfvsxwvwestqsfndkjq"};
	ft_strlen_cases[3] = (ft_strlen_test_data){""};
	ft_strlen_cases[4] = (ft_strlen_test_data){"1111111111111111122"};
	ft_strlen_cases[5] = (ft_strlen_test_data){"\n\n\n\n\n\n\n\n"};
	ft_strlen_cases[6] = (ft_strlen_test_data){"HAHAHAHA \0 TA FAIL XD"};

	for (int i = 0; i < ft_strlen_cases_size; i++)
	{
		printf("Test %d : ", i + 1);
		size_t actual = ft_strlen(ft_strlen_cases[i].str);
		size_t expected = strlen(ft_strlen_cases[i].str);
		if (actual == expected)
			printf("OK\n");
		else {
			printf("KO\n");
			printf("Expected length of string %s is %zu, got %zu\n", ft_strlen_cases[i].str, expected, actual);
			exit(1);
		}
	}
}

typedef struct ft_strcmp_test_data {
	char	*s1;
	char	*s2;
} ft_strcmp_test_data;

void test_ft_strcmp() {
	printf("#####################################################\n");
	printf("####                 FT_STRCMP                   ####\n");
	printf("#####################################################\n");

	int ft_strcmp_cases_size = 9;
	ft_strcmp_test_data ft_strcmp_cases[ft_strcmp_cases_size];

	ft_strcmp_cases[0] = (ft_strcmp_test_data){"test", "test"};
	ft_strcmp_cases[1] = (ft_strcmp_test_data){"testqsfndkjq", "testqsfndkjq"};
	ft_strcmp_cases[2] = (ft_strcmp_test_data){"dfvsxwvwestqsfndkjq", "q"};
	ft_strcmp_cases[3] = (ft_strcmp_test_data){"", ""};
	ft_strcmp_cases[4] = (ft_strcmp_test_data){"1111111111111111122", "2111111"};
	ft_strcmp_cases[5] = (ft_strcmp_test_data){"\n\n\n\n\n\n\n\n", "\n\n\n\n\n\n\n\n"};
	ft_strcmp_cases[6] = (ft_strcmp_test_data){"HAHAHAHA \0 TA FAIL XD", "HAHAHAHA \0 GGGGGGGGG"};
	ft_strcmp_cases[7] = (ft_strcmp_test_data){"", "value"};
	ft_strcmp_cases[8] = (ft_strcmp_test_data){"value", ""};

	for (int i = 0; i < ft_strcmp_cases_size; i++)
	{
		printf("Test %d : ", i + 1);
		int actual = ft_strcmp(ft_strcmp_cases[i].s1, ft_strcmp_cases[i].s2);
		int expected = strcmp(ft_strcmp_cases[i].s1, ft_strcmp_cases[i].s2);
		if (actual == expected)
			printf("OK\n");
		else {
			printf("KO\n");
			printf("Expected result of strcmp(%s, %s) is %d, got %d\n", ft_strcmp_cases[i].s1, ft_strcmp_cases[i].s2, expected, actual);
			exit(1);
		}
	}
}

typedef struct ft_strdup_test_data {
    char	*str;
} ft_strdup_test_data;

void test_ft_strdup() {
    printf("#####################################################\n");
    printf("####                 FT_STRDUP                   ####\n");
    printf("#####################################################\n");

    int ft_strdup_cases_size = 7;
    ft_strdup_test_data ft_strdup_cases[ft_strdup_cases_size];

    ft_strdup_cases[0] = (ft_strdup_test_data){"test"};
    ft_strdup_cases[1] = (ft_strdup_test_data){"testqsfndkjq"};
    ft_strdup_cases[2] = (ft_strdup_test_data){"q"};
    ft_strdup_cases[3] = (ft_strdup_test_data){""};
    ft_strdup_cases[4] = (ft_strdup_test_data){"1111111111111111122"};
    ft_strdup_cases[5] = (ft_strdup_test_data){"\n\n\n\n\n\n\n\n"};
    ft_strdup_cases[6] = (ft_strdup_test_data){"HAHAHAHA \0 TA FAIL XD"};

    for (int i = 0; i < ft_strdup_cases_size; i++)
    {
        printf("Test %d : ", i + 1);
        char * actual = ft_strdup(ft_strdup_cases[i].str);
        char * expected = strdup(ft_strdup_cases[i].str);
        if (strcmp(actual, expected) == 0) {
            printf("OK\n");
            free(actual);
            free(expected);
        }
        else {
            printf("KO\n");
            printf("Expected result of strdup(%s) is %s, got %s\n", ft_strdup_cases[i].str, expected, actual);
            exit(1);
        }
    }
}

typedef struct ft_strcpy_test_data {
    char	*str;
} ft_strcpy_test_data;

void test_ft_strcpy() {
    printf("#####################################################\n");
    printf("####                 FT_STRCPY                   ####\n");
    printf("#####################################################\n");

    int ft_strcpy_cases_size = 7;
    ft_strcpy_test_data ft_strcpy_cases[ft_strcpy_cases_size];

    ft_strcpy_cases[0] = (ft_strcpy_test_data){"test"};
    ft_strcpy_cases[1] = (ft_strcpy_test_data){"testqsfndkjq"};
    ft_strcpy_cases[2] = (ft_strcpy_test_data){"q"};
    ft_strcpy_cases[3] = (ft_strcpy_test_data){""};
    ft_strcpy_cases[4] = (ft_strcpy_test_data){"1111111111111111122"};
    ft_strcpy_cases[5] = (ft_strcpy_test_data){"\n\n\n\n\n\n\n\n"};
    ft_strcpy_cases[6] = (ft_strcpy_test_data){"HAHAHAHA \0 TA FAIL XD"};

    for (int i = 0; i < ft_strcpy_cases_size; i++)
    {
        printf("Test %d : ", i + 1);
        size_t len = strlen(ft_strcpy_cases[i].str);
        char *actual = malloc(len + 1);
        ft_strcpy(actual, ft_strcpy_cases[i].str);
        char *expected = malloc(len + 1);
        strcpy(expected, ft_strcpy_cases[i].str);
        if (strcmp(actual, expected) == 0) {
            printf("OK\n");
            free(actual);
            free(expected);
        }
        else {
            printf("KO\n");
            printf("Expected result of strcpy(%s, _) is %s, got %s\n", ft_strcpy_cases[i].str, expected, actual);
            exit(1);
        }
    }
}

void test_ft_read() {
    printf("#####################################################\n");
    printf("####                  FT_READ                    ####\n");
    printf("#####################################################\n");

    printf("Test 1 : ");

    char actual[1000];
    ssize_t actual_count = ft_read(0, actual, 1000);
    actual[actual_count] = '\0';

    char expected[1000];
    ssize_t expected_count = read(0, expected, 1000);
    expected[expected_count] = '\0';

    if (strcmp(actual, expected) == 0 && actual_count == expected_count) {
        printf("OK\n");
    }
    else {
        printf("KO\n");
        printf("Expected result of read is %s, %ld, got %s, %ld\n", expected, expected_count, actual, actual_count);
        exit(1);
    }
}

void test_ft_write() {
    printf("#####################################################\n");
    printf("####                  FT_WRITE                   ####\n");
    printf("#####################################################\n");

    printf("Test 1 :\n");
    char *str1 = "test line";
    ft_write(0, str1, 10);
    printf("\n");
    write(0, str1, 10);

    printf("\n");

    printf("Test 2 :\n");
    char *str2 = "test line with zero \0 fffff";
    ft_write(0, str2, 28);
    printf("\n");
    write(0, str2, 28);

    printf("\n");

    printf("Test 3 :\n");
    char *str3 = NULL;
    ft_write(0, str3, 0);
    printf("\n");
    write(0, str3, 0);

    printf("\n");

    printf("Compare this lines by yourself :)\n");
}

int	main() {
    test_ft_strlen();
    printf("\n");
    test_ft_strcmp();
    printf("\n");
    test_ft_strdup();
    printf("\n");
    test_ft_strcpy();
    printf("\n");
    test_ft_read();
    printf("\n");
    test_ft_write();
}
