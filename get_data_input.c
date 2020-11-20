/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   get_data_input.c                                   :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: fprovolo <fprovolo@student.42.fr>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2020/11/11 19:21:35 by fprovolo          #+#    #+#             */
/*   Updated: 2020/11/20 17:55:44 by fprovolo         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "lem_in.h"

t_data	*get_data_input(t_data_input *data_input)
{
	char			*line;
	char			*trimmed;
	t_data_input	*tmp;
	t_data			*data_lim;

	tmp = data_input;
	while (get_next_line(0, &line) > 0)
	{
		trimmed = ft_strtrim(line);
		free(line);
		tmp->str = trimmed;
		tmp->next = new_data_inputlist();
		tmp = tmp->next;
	}
	data_lim = parse_data(data_input);
	while (data_input->next)
	{
		ft_printf("%s\n", data_input->str);
		data_input = data_input->next;
	}
	return (data_lim);
}
