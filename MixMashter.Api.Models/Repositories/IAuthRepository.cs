﻿using MixMashter.Api.Models.Command;
using MixMashter.Api.Models.Entities;
using MixMashter.Api.Models.Queries;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Tools.CQS.Command;
using Tools.CQS.Queries;

namespace MixMashter.Api.Models.Repositories
{
    public interface IAuthRepository : ICommandHandler<RegisterCommand>,
        IQueryHandler<LoginQuery,User>
    {
         
    }
}
