import { ArgumentsHost, ExceptionFilter } from "@nestjs/common";
import { Response } from "express";

export class operacaoNomeFilter implements ExceptionFilter{
    catch(exception: any, host: ArgumentsHost) {
        const ctx = host.switchToHttp();
        const response = ctx.getResponse<Response>();

        response.status(409).json ({
            statuscode:409,
            message: exception.message
        });
    }
}