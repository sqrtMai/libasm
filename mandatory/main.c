#include <stdio.h>
#include <stdlib.h>
#include <string.h>
typedef struct s_list
{
    void *data;
    struct s_list *next;
} t_list;

t_list *ft_create_elem(void *data);
void ft_list_push_front(t_list **head, void *data);
int ft_list_size(t_list *head);
void ft_list_remove_if(t_list **begin_list, void *data_ref, int (*cmp)(), void (*free_fct)(void *));


int cmp(void* data1, void *data2)
{
	return 0;
}

void free_node(void *node)
{
	if (node)
	{
		free(node);
	}
}

int main(void)
{
	t_list *node = calloc(1, sizeof(t_list));
	node->next = calloc(1, sizeof(t_list));
	t_list **head = &node;

	printf("1st : %p\n", node);
	printf("2nd : %p\n", node->next);


	ft_list_remove_if(head, NULL, cmp, free_node);
	printf("new 1st : %p\n", *head);
	return 0;
}

/*
nasm -f elf64 -g ft_list_remove_if.s -o ft_list_remove_if.o
gcc main.c -g ft_list_remove_if.o -o test
*/
