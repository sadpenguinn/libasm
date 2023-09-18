/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   main.c                                             :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: frdescam <marvin@42.fr>                    +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2020/07/27 13:28:53 by frdescam          #+#    #+#             */
/*   Updated: 2020/07/31 00:17:21 by frdescam         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <unistd.h>
#include <errno.h>
#include <fcntl.h>

size_t	ft_strlen(const char *str);
// char	*ft_strcpy(char *dest, char *src);
int		ft_strcmp(char *s1, char *s2);
// ssize_t	ft_write(int fd, const void *buf, size_t count);
// ssize_t	ft_read(int fd, void *buf, size_t count);
// char	*ft_strdup(const char *s);

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

int	main() {
	test_ft_strlen();
	printf("\n");
	test_ft_strcmp();
}
